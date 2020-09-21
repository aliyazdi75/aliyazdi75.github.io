import 'dart:async';
import 'dart:convert';
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

@Task('Transform arb to xml for English')
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

// Function to make sure we capture all of the stdout.
// Reference: https://github.com/dart-lang/sdk/issues/31666
Future<String> _startProcess(String executable,
    {List<String> arguments = const [], String input}) async {
  final output = <int>[];
  final completer = Completer<int>();
  final process = await Process.start(executable, arguments);
  process.stdin.writeln(input);
  process.stdout.listen(
    (event) {
      output.addAll(event);
    },
    onDone: () async => completer.complete(await process.exitCode),
  );
  await process.stdin.close();

  final exitCode = await completer.future;
  if (exitCode != 0) {
    stderr.write(
      'Running "$executable ${arguments.join(' ')}" failed with $exitCode.\n',
    );
    exit(exitCode);
  }
  return Future<String>.value(utf8.decoder.convert(output));
}
