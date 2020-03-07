import 'dart:html';

import 'key_finder_interface.dart';

Window windowLoc;

class WebKeyFinder implements KeyFinder {
  WebKeyFinder() {
    windowLoc = window;
    print("Widnow is initialized");
    // storing something initially just to make sure it works. :)
    windowLoc.localStorage["MyKey"] = "I am from web local storage";
  }

  String getKeyValue(String key) {
    return windowLoc.localStorage[key];
  }

  void setKeyValue(String key, String value) {
    windowLoc.localStorage[key] = value;
  }
}

KeyFinder getKeyFinder() => WebKeyFinder();
