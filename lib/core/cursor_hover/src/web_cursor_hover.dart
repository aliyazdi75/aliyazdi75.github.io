import 'dart:html' as html;

import 'package:my_site/core/constants/index.dart';

import 'cursor_hover_interface.dart';
import 'cursor_type.dart';

class WebHover implements CursorHover {
  WebHover() {
    appContainer = html.window.document.getElementById(mySiteWebBodyId);
  }

  html.Element appContainer;

  @override
  void onHover(String cursorType) => appContainer.style.cursor = cursorType;

  @override
  void onExit() => appContainer.style.cursor = CursorType.defaults;
}

CursorHover getCursorHover() => WebHover();
