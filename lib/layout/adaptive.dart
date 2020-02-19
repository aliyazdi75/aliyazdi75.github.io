import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';

enum DesignType {
  material,
  cupertino,
}

enum DisplayType {
  desktop,
  mobile,
}

enum OrientationType {
  landscape,
  portrait,
}

enum SizeType {
  large,
  small,
}

DesignType designTypeOf(BuildContext context) {
  if (kIsWeb) {
    return DesignType.material;
  } else if (Platform.isMacOS || Platform.isIOS) {
    return DesignType.cupertino;
  } else {
    return DesignType.material;
  }
}

DisplayType displayTypeOf(BuildContext context) {
  if (MediaQuery.of(context).size.shortestSide > desktopBreakpoint) {
    return DisplayType.desktop;
  } else {
    return DisplayType.mobile;
  }
}

OrientationType orientationTypeOf(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return OrientationType.landscape;
  } else {
    return OrientationType.portrait;
  }
}

SizeType sizeTypeOf(BuildContext context) {
  if (displayTypeOf(context) == DisplayType.desktop) {
    if (MediaQuery.of(context).size.width > smallDesktopMaxWidth) {
      return SizeType.large;
    } else {
      return SizeType.small;
    }
  } else {
    if (MediaQuery.of(context).size.width > smallMobileMaxWidth) {
      return SizeType.large;
    } else {
      return SizeType.small;
    }
  }
}

bool isSmallDisplay(BuildContext context) {
  return sizeTypeOf(context) == SizeType.small;
}

class AdaptiveSize extends StatelessWidget {
  const AdaptiveSize({
    Key key,
    @required this.largeScreen,
    @required this.smallScreen,
  }) : super(key: key);

  final Widget largeScreen;
  final Widget smallScreen;

  @override
  Widget build(BuildContext context) {
    final bool isSmall = isSmallDisplay(context);
    return isSmall ? smallScreen : largeScreen;
  }
}

class AdaptiveDesign extends StatelessWidget {
  const AdaptiveDesign({
    Key key,
    @required this.materialTheme,
    @required this.cupertinoTheme,
  }) : super(key: key);

  final Widget materialTheme;
  final Widget cupertinoTheme;

  @override
  Widget build(BuildContext context) {
    final bool materialDesign = designTypeOf(context) == DesignType.material;
    return materialDesign ? materialTheme : cupertinoTheme;
  }
}
