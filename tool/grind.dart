import 'dart:async';
import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:path/path.dart' as path;

void main(List<String> args) => grind(args);

@Task('Get packages')
Future<void> pubGet({String directory}) async {
  await _runProcess(
    'flutter',
    ['pub', 'get', if (directory != null) directory],
  );
}

@Task('Format dart files')
Future<void> format({String path = '.'}) async {
  await _runProcess('flutter', ['format', path]);
}

@Task('Generate localizations files')
Future<void> generateLocalizations() async {
  final l10nScriptFile = path.join(
    _flutterRootPath(),
    'dev',
    'tools',
    'localization',
    'bin',
    'gen_l10n.dart',
  );

  Dart.run(l10nScriptFile, arguments: [
    '--template-arb-file=intl_en.arb',
    '--output-localization-file=my_site_localizations.dart',
    '--output-class=MySiteLocalizations',
    '--preferred-supported-locales=["en"]'
  ]);
  await format(path: path.join('lib', 'l10n'));
}

@Task('Transform arb to xml for English')
@Depends(generateLocalizations)
Future<void> l10n() async {
  final l10nPath =
      path.join(Directory.current.path, 'tool', 'l10n_cli', 'main.dart');
  Dart.run(l10nPath);
}

@Task('Verify xml localizations')
Future<void> verifyL10n() async {
  final l10nPath =
      path.join(Directory.current.path, 'tool', 'l10n_cli', 'main.dart');

  // Run the tool to transform arb to xml, and write the output to stdout.
  final xmlOutput = Dart.run(l10nPath, arguments: ['--dry-run'], quiet: true);

  // Read the original xml file.
  final xmlPath =
      path.join(Directory.current.path, 'lib', 'l10n', 'intl_en.xml');
  final expectedXmlOutput = await File(xmlPath).readAsString();

  if (xmlOutput.trim() != expectedXmlOutput.trim()) {
    stderr.writeln(
      'The contents of $xmlPath are different from that produced by '
      'l10n_cli. Did you forget to run `flutter pub run grinder '
      'l10n` after updating an .arb file?',
    );
    exit(1);
  }
}

Future<void> _runProcess(String executable, List<String> arguments) async {
  final result = await Process.run(executable, arguments);
  stdout.write(result.stdout);
  stderr.write(result.stderr);
}

/// Return the flutter root path from the environment variables.
String _flutterRootPath() {
  final separator = (Platform.isWindows) ? ';' : ':';
  final flutterBinPath =
      Platform.environment['PATH'].split(separator).lastWhere((setting) {
    return path.canonicalize(setting).endsWith(path.join('flutter', 'bin'));
  });
  return Directory(flutterBinPath).parent.path;
}
