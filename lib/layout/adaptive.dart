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
  medium,
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
  final platformWidth = MediaQuery.of(context).size.width;
  if (displayTypeOf(context) == DisplayType.desktop) {
    if (platformWidth > mediumDesktopMaxWidth) {
      return SizeType.large;
    } else if (platformWidth > smallDesktopMaxWidth) {
      return SizeType.medium;
    } else {
      return SizeType.small;
    }
  } else {
    if (platformWidth > mediumMobileMaxWidth) {
      return SizeType.large;
    } else if (platformWidth > smallMobileMaxWidth) {
      return SizeType.medium;
    } else {
      return SizeType.small;
    }
  }
}

bool isMediumDisplay(BuildContext context) {
  return sizeTypeOf(context) == SizeType.medium;
}

bool isSmallDisplay(BuildContext context) {
  return sizeTypeOf(context) == SizeType.small;
}

class AdaptiveSize extends StatelessWidget {
  const AdaptiveSize({
    Key key,
    @required this.large,
    @required this.small,
  }) : super(key: key);

  final Widget large;
  final Widget small;

  @override
  Widget build(BuildContext context) {
    final bool isSmall = isMediumDisplay(context);
    return isSmall ? small : large;
  }
}

class AdaptiveDesign extends StatelessWidget {
  const AdaptiveDesign({
    Key key,
    @required this.material,
    @required this.cupertino,
  }) : super(key: key);

  final Widget material;
  final Widget cupertino;

  @override
  Widget build(BuildContext context) {
    final bool materialDesign = designTypeOf(context) == DesignType.material;
    return materialDesign ? material : cupertino;
  }
}
