// Place fonts/MySiteIcons.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: MySiteIcons
//      fonts:
//       - asset: fonts/MySiteIcons.ttf
import 'package:flutter/widgets.dart';

class MySiteIcons {
  MySiteIcons._();

  static const String _fontFamily = 'MySiteIcons';

  static const IconData discord = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData blogger = IconData(0xe909, fontFamily: _fontFamily);
  static const IconData instagram = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData telegram = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData twitch = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData youtube = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData twitter = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData github = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData linkedin = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData email = IconData(0xe908, fontFamily: _fontFamily);
}
