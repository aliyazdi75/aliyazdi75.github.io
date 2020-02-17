import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:my_site/l10n/messages_all.dart';

class MySiteLocalizations {
  MySiteLocalizations(Locale locale)
      : _localeName = Intl.canonicalizedLocale(locale.toString());

  final String _localeName;

  static Future<MySiteLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString())
        .then<MySiteLocalizations>((_) => MySiteLocalizations(locale));
  }

  static MySiteLocalizations of(BuildContext context) {
    return Localizations.of<MySiteLocalizations>(context, MySiteLocalizations);
  }

  static const LocalizationsDelegate<MySiteLocalizations> delegate =
      _MySiteLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', 'US'),
    Locale('fa'),
  ];

  String aboutDialogDescription(Object value) {
    return Intl.message(
      'To see the source code for this app, please visit the $value.',
      locale: _localeName,
      name: 'aboutDialogDescription',
      desc: r'A description about how to view the source code for this app.',
      args: <Object>[value],
    );
  }

  String craneHours(int hours) {
    return Intl.plural(
      hours,
      locale: _localeName,
      name: 'craneHours',
      desc:
          r'Generic text for an amount of hours, abbreviated to the shortest form. For example 1h. {hours} should remain untranslated.',
      args: <Object>[hours],
      one: '1h',
      other: '${hours}h',
    );
  }

  String craneMinutes(int minutes) {
    return Intl.plural(
      minutes,
      locale: _localeName,
      name: 'craneMinutes',
      desc:
          r'Generic text for an amount of minutes, abbreviated to the shortest form. For example 15m. {minutes} should remain untranslated.',
      args: <Object>[minutes],
      one: '1m',
      other: '${minutes}m',
    );
  }

  String get mySiteTitle {
    return Intl.message(
      'Ali Yazdi\'s Profile',
      locale: _localeName,
      name: 'mySiteTitle',
      desc: r'Title for app.',
    );
  }
}

class _MySiteLocalizationsDelegate
    extends LocalizationsDelegate<MySiteLocalizations> {
  const _MySiteLocalizationsDelegate();

  @override
  Future<MySiteLocalizations> load(Locale locale) =>
      MySiteLocalizations.load(locale);

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'fa',
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_MySiteLocalizationsDelegate old) => false;
}
