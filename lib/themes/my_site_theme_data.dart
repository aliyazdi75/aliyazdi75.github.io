import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySiteThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData _lightThemeData = ThemeData.light();
  static ThemeData _darkThemeData = ThemeData.dark();

  static ThemeData lightThemeData =
      themeData(_lightThemeData, lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData =
      themeData(_darkThemeData, darkColorScheme, _darkFocusColor);

  static CupertinoThemeData cupertinoLightThemeData =
      cupertinoThemeData(Brightness.light, lightColorScheme, _lightFocusColor);
  static CupertinoThemeData cupertinoDarkThemeData =
      cupertinoThemeData(Brightness.dark, darkColorScheme, _darkFocusColor);

  static ThemeData themeData(
      ThemeData themeData, ColorScheme colorScheme, Color focusColor) {
    return themeData.copyWith(
      colorScheme: colorScheme,
      textTheme: _textTheme(themeData.textTheme),
      appBarTheme: AppBarTheme(
        textTheme: _textTheme(themeData.textTheme)
            .apply(bodyColor: colorScheme.onPrimary),
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.primary,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: colorScheme,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      cursorColor: colorScheme.primary,
      toggleableActiveColor: colorScheme.primary,
      indicatorColor: colorScheme.onPrimary,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme(themeData.textTheme)
            .subtitle1
            .apply(color: _darkFillColor),
      ),
      typography: Typography.material2018(
        platform: defaultTargetPlatform,
        englishLike: Typography.englishLike2018,
        dense: Typography.dense2018,
        tall: Typography.tall2018,
      ),
    );
  }

  static CupertinoThemeData cupertinoThemeData(
      Brightness brightness, ColorScheme colorScheme, Color focusColor) {
    return CupertinoThemeData(
      brightness: brightness,
      primaryColor: colorScheme.primary,
      primaryContrastingColor: colorScheme.primaryVariant,
      barBackgroundColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
    );
  }

  static ColorScheme lightColorScheme = ColorScheme.dark().copyWith(
    primary: const Color(0xFFB93C5D),
    primaryVariant: const Color(0xFF117378),
    secondary: const Color(0xFFEFF3F3),
    secondaryVariant: const Color(0xFFFAFBFB),
    background: const Color(0xFFE6EBEB),
    surface: const Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: const Color(0xFF322942),
    onSurface: const Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static ColorScheme darkColorScheme = ColorScheme.light().copyWith(
    primary: const Color(0xFFFF8383),
    primaryVariant: const Color(0xFF1CDEC9),
    secondary: const Color(0xFF4D1F7C),
    secondaryVariant: const Color(0xFF451B6F),
    background: const Color(0xFF241E30),
    surface: const Color(0xFF1F1929),
    onBackground: Colors.white.withOpacity(0.05),
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static TextTheme _textTheme(TextTheme textTheme) {
    return textTheme.copyWith(
      bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
      bodyText2: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
      headline4: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
      headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
      headline6: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
      subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
      subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
      caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
      overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
      button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
    );
  }
}
