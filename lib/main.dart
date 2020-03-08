import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/data/my_site_options.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:my_site/layout/adaptive.dart';
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

void main() {
  setOverrideForDesktop();
  runApp(MySite());
}

class MySite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: MySiteOptions(
        themeMode: kIsWeb ? ThemeMode.dark : ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        locale: Locale('fa'),
        platform: defaultTargetPlatform,
      ),
      child: Builder(
        builder: (context) {
          return AdaptiveDesign(
            material: MaterialApp(
              title: mySiteTitle,
              onGenerateTitle: (context) =>
                  MySiteLocalizations.of(context).mySiteTitle,
              debugShowCheckedModeBanner: false,
              themeMode: MySiteOptions.of(context).themeMode,
              theme: MySiteThemeData.lightThemeData(
                      MySiteOptions.of(context).locale)
                  .copyWith(platform: MySiteOptions.of(context).platform),
              darkTheme: MySiteThemeData.darkThemeData(
                      MySiteOptions.of(context).locale)
                  .copyWith(platform: MySiteOptions.of(context).platform),
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
              builder: (context, route) {
                return ApplyTextOptions(
                  child: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle(
                      systemNavigationBarColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      systemNavigationBarIconBrightness:
                          Theme.of(context).brightness == Brightness.light
                              ? Brightness.dark
                              : Brightness.light,
                    ),
                    child: HomePage(),
                  ),
                );
              },
            ),
            cupertino: CupertinoApp(
              title: mySiteTitle,
              onGenerateTitle: (context) =>
                  MySiteLocalizations.of(context).mySiteTitle,
              debugShowCheckedModeBanner: false,
              theme: MaterialBasedCupertinoThemeData(
                materialTheme: MySiteOptions.of(context).themeData(context),
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
              builder: (context, route) {
                return ApplyTextOptions(
                  child: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle(
                      systemNavigationBarColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      systemNavigationBarIconBrightness:
                          Theme.of(context).brightness == Brightness.light
                              ? Brightness.dark
                              : Brightness.light,
                    ),
                    child: HomePage(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
