import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum DisplayType {
  material,
  cupertino,
}

enum SizeType {
  small,
  medium,
  large,
}

enum OrientationType {
  landscape,
  portrait,
}

const _desktopBreakpoint = 700.0;
const _smallDesktopMaxWidth = 1000.0;

DisplayType displayTypeOf(BuildContext context) {
  if (kIsWeb) {
    return DisplayType.material;
  } else if (Platform.isMacOS || Platform.isIOS) {
    return DisplayType.cupertino;
  } else {
    return DisplayType.material;
  }
}

SizeType sizeTypeOf(BuildContext context) {
  if (MediaQuery.of(context).size.shortestSide > _desktopBreakpoint) {
    return DeviceType.desktop;
  } else {
    return DeviceType.mobile;
  }
}

OrientationType orientationTypeOf(BuildContext context) {
  if (MediaQuery.of(context).size.shortestSide > _desktopBreakpoint) {
    return DeviceType.desktop;
  } else {
    return DeviceType.mobile;
  }
}

bool isDisplaySmallDesktop(BuildContext context) {
  return isDisplayDesktop(context) &&
      MediaQuery.of(context).size.width < _smallDesktopMaxWidth;
}
