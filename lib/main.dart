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

void main() {
  // Do something when app faced an error on release
  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
    //if (kReleaseMode)
    //  exit(1);
  };
  runApp(MySite());
}

class MySite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: MySiteOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
//        locale: Locale('fa'),
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
              theme: MySiteThemeData.lightThemeData(context)
                  .copyWith(platform: MySiteOptions.of(context).platform),
              darkTheme: MySiteThemeData.darkThemeData(context)
                  .copyWith(platform: MySiteOptions.of(context).platform),
              localizationsDelegates: const [
                ...MySiteLocalizations.localizationsDelegates,
                LocaleNamesLocalizationsDelegate()
              ],
              supportedLocales: MySiteLocalizations.supportedLocales,
              locale: MySiteOptions.of(context).locale,
              localeResolutionCallback: (locale, supportedLocales) {
                deviceLocale = locale;
                return locale;
//                final isSupported = supportedLocales.contains(
//                  supportedLocales.singleWhere(
//                    (element) => element.languageCode == locale?.languageCode,
//                    orElse: () => null,
//                  ),
//                );
//                if (isSupported) {
//                  deviceLocale = locale;
//                } else {
//                  deviceLocale = supportedLocales.first;
//                }
//                return isSupported ? locale : supportedLocales.first;
              },
              builder: (context, child) {
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
                    child: child,
                  ),
                );
              },
              home: HomePage(),
            ),
            cupertino: CupertinoApp(
              title: mySiteTitle,
              onGenerateTitle: (context) =>
                  MySiteLocalizations.of(context).mySiteTitle,
              debugShowCheckedModeBanner: false,
              theme: MaterialBasedCupertinoThemeData(
                materialTheme: MySiteOptions.of(context).themeData(context),
              ),
              localizationsDelegates: const [
                ...MySiteLocalizations.localizationsDelegates,
                LocaleNamesLocalizationsDelegate()
              ],
              supportedLocales: MySiteLocalizations.supportedLocales,
              locale: MySiteOptions.of(context).locale,
              localeResolutionCallback: (locale, supportedLocales) {
                deviceLocale = locale;
                return locale;
//                final isSupported = supportedLocales.contains(
//                  supportedLocales.singleWhere(
//                    (element) => element.languageCode == locale?.languageCode,
//                    orElse: () => null,
//                  ),
//                );
//                if (isSupported) {
//                  deviceLocale = locale;
//                } else {
//                  deviceLocale = supportedLocales.first;
//                }
//                return isSupported ? locale : supportedLocales.first;
              },
              builder: (context, child) {
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
                    child: child,
                  ),
                );
              },
              home: HomePage(),
            ),
          );
        },
      ),
    );
  }
}
