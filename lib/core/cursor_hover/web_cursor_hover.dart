import 'dart:html' as html;

import 'package:my_site/core/constants/index.dart';

import 'cursor_hover_interface.dart';

class WebHover implements CursorHover {
  WebHover() {
    appContainer = html.window.document.getElementById(mySiteWebBodyId);
  }

  html.Element appContainer;

  @override
  void onHover() => appContainer.style.cursor = 'pointer';

  @override
  void onExit() => appContainer.style.cursor = 'default';
}

CursorHover getCursorHover() => WebHover();
