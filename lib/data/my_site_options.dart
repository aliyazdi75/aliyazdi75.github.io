import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_site/core/constants/src/size.dart';
import 'package:my_site/themes/my_site_theme_data.dart';

Locale _deviceLocale;

Locale get deviceLocale => _deviceLocale;

set deviceLocale(Locale locale) {
  if (_deviceLocale == null) {
    _deviceLocale = locale;
  }
}

class MySiteOptions {
  const MySiteOptions({
    this.themeMode,
    double textScaleFactor,
    Locale locale,
    this.platform,
  })  : _textScaleFactor = textScaleFactor,
        _locale = locale;

  final ThemeMode themeMode;
  final double _textScaleFactor;
  final Locale _locale;
  final TargetPlatform platform;

  double textScaleFactor(BuildContext context, {bool useSentinel = false}) {
    if (_textScaleFactor == systemTextScaleFactorOption) {
      return useSentinel
          ? systemTextScaleFactorOption
          : MediaQuery.of(context).textScaleFactor;
    } else {
      return _textScaleFactor;
    }
  }

  ThemeData themeData(BuildContext context) {
    if (themeMode == ThemeMode.system) {
      return MediaQuery.platformBrightnessOf(context) == Brightness.light
          ? MySiteThemeData.lightThemeData
              .copyWith(platform: MySiteOptions.of(context).platform)
          : MySiteThemeData.darkThemeData
              .copyWith(platform: MySiteOptions.of(context).platform);
    } else {
      return themeMode == ThemeMode.light
          ? MySiteThemeData.lightThemeData
              .copyWith(platform: MySiteOptions.of(context).platform)
          : MySiteThemeData.darkThemeData
              .copyWith(platform: MySiteOptions.of(context).platform);
    }
  }

  Locale get locale =>
      _locale ??
      deviceLocale ??
      (!kIsWeb && Platform.isMacOS ? Locale('en', 'US') : null);

  MySiteOptions copyWith({
    ThemeMode themeMode,
    double textScaleFactor,
    Locale locale,
    TargetPlatform platform,
  }) {
    return MySiteOptions(
      themeMode: themeMode ?? this.themeMode,
      textScaleFactor: textScaleFactor ?? this._textScaleFactor,
      locale: locale ?? this.locale,
      platform: platform ?? this.platform,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is MySiteOptions &&
      themeMode == other.themeMode &&
      _textScaleFactor == other._textScaleFactor &&
      locale == other.locale &&
      platform == other.platform;

  @override
  int get hashCode => hashValues(
        themeMode,
        _textScaleFactor,
        locale,
        platform,
      );

  static MySiteOptions of(BuildContext context) {
    final _ModelBindingScope scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, MySiteOptions newModel) {
    final _ModelBindingScope scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>();
    scope.modelBindingState.updateModel(newModel);
  }
}

class ApplyTextOptions extends StatelessWidget {
  const ApplyTextOptions({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final options = MySiteOptions.of(context);
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
  _ModelBindingScope({
    Key key,
    @required this.modelBindingState,
    Widget child,
  })  : assert(modelBindingState != null),
        super(key: key, child: child);

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  ModelBinding({
    Key key,
    this.initialModel = const MySiteOptions(),
    this.child,
  })  : assert(initialModel != null),
        super(key: key);

  final MySiteOptions initialModel;
  final Widget child;

  _ModelBindingState createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  MySiteOptions currentModel;

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
