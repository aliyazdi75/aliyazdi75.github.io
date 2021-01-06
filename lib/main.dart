import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/my_site_localizations.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/core/routes.dart';
import 'package:my_site/data/my_site_options.dart';
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
  //todo: should fix this
  // UrlStrategy.configure();
  runApp(const MySite());
}

class MySite extends StatelessWidget {
  const MySite({
    Key key,
    this.initialRoute,
    this.isTestMode = false,
  }) : super(key: key);

  final bool isTestMode;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: MySiteOptions(
        themeMode: ThemeMode.system,
        textScaleFactor: systemTextScaleFactorOption,
        // locale: Locale('fa'),
        // locale: null,
        platform: defaultTargetPlatform,
        isTestMode: isTestMode,
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
              localizationsDelegates:
                  MySiteLocalizations.localizationsDelegates,
              initialRoute: initialRoute,
              supportedLocales: MySiteLocalizations.supportedLocales,
              locale: MySiteOptions.of(context).locale,
              localeResolutionCallback: (locale, supportedLocales) {
                deviceLocale = locale;
                return locale;
              },
              onGenerateRoute: RouteConfiguration.onGenerateRoute,
            ),
            cupertino: CupertinoApp(
              title: mySiteTitle,
              onGenerateTitle: (context) =>
                  MySiteLocalizations.of(context).mySiteTitle,
              debugShowCheckedModeBanner: false,
              theme: MaterialBasedCupertinoThemeData(
                materialTheme: MySiteOptions.of(context).themeData(context),
              ),
              localizationsDelegates:
                  MySiteLocalizations.localizationsDelegates,
              supportedLocales: MySiteLocalizations.supportedLocales,
              locale: MySiteOptions.of(context).locale,
              localeResolutionCallback: (locale, supportedLocales) {
                deviceLocale = locale;
                return locale;
              },
              onGenerateRoute: RouteConfiguration.onGenerateRoute,
            ),
          );
        },
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplyTextOptions(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: MySiteOptions.of(context).resolvedSystemUiOverlayStyle(context),
        child: HomePage(),
      ),
    );
  }
}
