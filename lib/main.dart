import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_site/core/constants.dart';
import 'package:my_site/data/my_site_options.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:my_site/screens/home/home.dart';
import 'package:my_site/themes/my_site_theme_data.dart';

void setOverrideForDesktop() {
  if (kIsWeb) return;

  if (Platform.isMacOS) {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
  } else if (Platform.isFuchsia) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

main() {
  setOverrideForDesktop();
  GoogleFonts.config.allowHttp = false;
  runApp(MySite());
}

class MySite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: MySiteOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        locale: null,
        platform: defaultTargetPlatform,
      ),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Ali Yazdi\'s profile',
            debugShowCheckedModeBanner: false,
            themeMode: MySiteOptions.of(context).themeMode,
            theme: MySiteThemeData.lightThemeData.copyWith(
              platform: MySiteOptions.of(context).platform,
            ),
            darkTheme: MySiteThemeData.darkThemeData.copyWith(
              platform: MySiteOptions.of(context).platform,
            ),
            localizationsDelegates: [
              ...MySiteLocalizations.localizationsDelegates,
              LocaleNamesLocalizationsDelegate()
            ],
            supportedLocales: MySiteLocalizations.supportedLocales,
            locale: MySiteOptions.of(context).locale,
            localeResolutionCallback: (locale, supportedLocales) {
              deviceLocale = locale;
              return locale;
            },
            home: ApplyTextOptions(
              child: HomePage(),
            ),
          );
        },
      ),
    );
  }
}
