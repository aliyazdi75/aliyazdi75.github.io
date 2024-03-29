// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'key_finder_interface.dart';

late Window windowLoc;

class WebKeyFinder implements KeyFinder {
  WebKeyFinder() {
    windowLoc = window;
    // storing something initially just to make sure it works. :)
    windowLoc.localStorage['MyKey'] = 'I am from web local storage';
  }

  @override
  String getKeyValue(String key) {
    return windowLoc.localStorage[key]!;
  }

  @override
  void setKeyValue(String key, String value) {
    windowLoc.localStorage[key] = value;
  }
}

KeyFinder getKeyFinder() => WebKeyFinder();
