import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/data/my_site_options.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static Widget getLocaleIcon(BuildContext context) {
    final option = MySiteOptions.of(context);
    final firstLocale = const Icon(Icons.language);
    final secLocale = Icon(
      Icons.language,
      color: Theme.of(context).primaryColor,
    );

    if (deviceLocale.languageCode == 'en') {
      return option.locale.languageCode == 'en' ? firstLocale : secLocale;
    } else {
      return option.locale.languageCode == 'fa' ? firstLocale : secLocale;
    }
  }

  static Widget getThemeIcon(BuildContext context) {
    final option = MySiteOptions.of(context);
    final autoTheme = const Icon(Icons.brightness_auto);
    final darkTheme = Icon(
      Icons.brightness_3,
      color: Theme.of(context).primaryColor,
    );
    final lightTheme = Icon(
      Icons.brightness_7,
      color: Theme.of(context).primaryColor,
    );

    return option.themeMode == ThemeMode.system
        ? autoTheme
        : option.themeMode == ThemeMode.dark ? darkTheme : lightTheme;
  }

  static Widget getDownloadIcon() {
    return const Icon(Icons.get_app);
  }

  static void onLocalChanged(BuildContext context) {
    final option = MySiteOptions.of(context);
    void enLanguage() => MySiteOptions.update(
        context, option.copyWith(locale: const Locale('en')));
    void faLanguage() => MySiteOptions.update(
        context, option.copyWith(locale: const Locale('fa')));

    option.locale.languageCode == 'en' ? faLanguage() : enLanguage();
  }

  static void onThemeChanged(BuildContext context) {
    final option = MySiteOptions.of(context);

    option.themeMode == ThemeMode.system
        ? MySiteOptions.update(context,
            MySiteOptions.of(context).copyWith(themeMode: ThemeMode.dark))
        : option.themeMode == ThemeMode.dark
            ? MySiteOptions.update(context,
                MySiteOptions.of(context).copyWith(themeMode: ThemeMode.light))
            : MySiteOptions.update(
                context,
                MySiteOptions.of(context)
                    .copyWith(themeMode: ThemeMode.system));
  }

  static Future<void> onPressedDownload() async {
    if (await canLaunch(downloadPage)) {
      await launch(downloadPage);
    }
  }
}
