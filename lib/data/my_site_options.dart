import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/themes/my_site_theme_data.dart';

const systemLocaleOption = Locale('system');

Locale? _deviceLocale;

Locale? get deviceLocale => _deviceLocale;

set deviceLocale(Locale? locale) {
  _deviceLocale ??= locale;
}

class MySiteOptions {
  const MySiteOptions({
    this.themeMode,
    double? textScaleFactor,
    Locale? locale,
    this.platform,
    this.isTestMode,
  })  : _textScaleFactor = textScaleFactor,
        _locale = locale;

  final ThemeMode? themeMode;
  final double? _textScaleFactor;
  final Locale? _locale;
  final TargetPlatform? platform;
  final bool? isTestMode; // True for integration tests.

  // We use a sentinel value to indicate the system text scale option. By
  // default, return the actual text scale factor, otherwise return the
  // sentinel value.
  double? textScaleFactor(BuildContext context, {bool useSentinel = false}) {
    if (_textScaleFactor == systemTextScaleFactorOption) {
      return useSentinel
          ? systemTextScaleFactorOption
          : MediaQuery.of(context).textScaleFactor;
    } else {
      return _textScaleFactor;
    }
  }

  Locale? get locale => _locale ?? deviceLocale;

  /// Returns a [SystemUiOverlayStyle] based on the [ThemeMode] setting.
  /// In other words, if the theme is dark, returns light; if the theme is
  /// light, returns dark.
  SystemUiOverlayStyle resolvedSystemUiOverlayStyle(BuildContext context) {
    Brightness brightness;
    switch (themeMode) {
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
      default:
        brightness = WidgetsBinding.instance!.window.platformBrightness;
    }

    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final overlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: scaffoldBackgroundColor,
      systemNavigationBarIconBrightness:
          brightness == Brightness.dark ? Brightness.light : Brightness.dark,
    );

    return overlayStyle;
  }

  ThemeData themeData(BuildContext context) {
    if (themeMode == ThemeMode.system) {
      return MediaQuery.platformBrightnessOf(context) == Brightness.light
          ? MySiteThemeData.lightThemeData(context)
              .copyWith(platform: MySiteOptions.of(context)!.platform)
          : MySiteThemeData.darkThemeData(context)
              .copyWith(platform: MySiteOptions.of(context)!.platform);
    } else {
      return themeMode == ThemeMode.light
          ? MySiteThemeData.lightThemeData(context)
              .copyWith(platform: MySiteOptions.of(context)!.platform)
          : MySiteThemeData.darkThemeData(context)
              .copyWith(platform: MySiteOptions.of(context)!.platform);
    }
  }

  MySiteOptions copyWith({
    ThemeMode? themeMode,
    double? textScaleFactor,
    Locale? locale,
    TargetPlatform? platform,
    bool? isTestMode,
  }) {
    return MySiteOptions(
      themeMode: themeMode ?? this.themeMode,
      textScaleFactor: textScaleFactor ?? _textScaleFactor,
      locale: locale ?? this.locale,
      platform: platform ?? this.platform,
      isTestMode: isTestMode ?? this.isTestMode,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is MySiteOptions &&
      themeMode == other.themeMode &&
      _textScaleFactor == other._textScaleFactor &&
      locale == other.locale &&
      platform == other.platform &&
      isTestMode == other.isTestMode;

  @override
  int get hashCode => hashValues(
        themeMode,
        _textScaleFactor,
        locale,
        platform,
        isTestMode,
      );

  static MySiteOptions? of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, MySiteOptions newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    scope.modelBindingState.updateModel(newModel);
  }
}

// Applies text GalleryOptions to a widget
class ApplyTextOptions extends StatelessWidget {
  const ApplyTextOptions({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final options = MySiteOptions.of(context)!;
    final textScaleFactor = options.textScaleFactor(context);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: textScaleFactor,
      ),
      child: child,
    );
  }
}

class _ModelBindingScope extends InheritedWidget {
  const _ModelBindingScope({
    Key? key,
    required this.modelBindingState,
    required Widget child,
  }) : super(key: key, child: child);

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  const ModelBinding({
    Key? key,
    this.initialModel = const MySiteOptions(),
    required this.child,
  }) : super(key: key);

  final MySiteOptions initialModel;
  final Widget child;

  @override
  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  late MySiteOptions currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(MySiteOptions newModel) {
    if (newModel != currentModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: widget.child,
    );
  }
}
