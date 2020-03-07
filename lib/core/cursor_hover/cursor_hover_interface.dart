import 'package:flutter/material.dart';

import 'cursor_hover_stub.dart'
    if (dart.library.html) 'web_cursor_hover.dart'
    if (dart.library.io) 'desktop_cursor_hover.dart';

class CursorHover extends StatelessWidget {
  const CursorHover({
    this.child,
    this.onHovered,
  });

  final Widget child;
  final Function onHovered;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: child,
      onHover: (event) {
        onHovered(true);
        Cursor().onHover();
      },
      onExit: (event) {
        onHovered(false);
        Cursor().onExit();
      },
    );
  }
}

abstract class Cursor {
  void onHover();
  void onExit();

  factory Cursor() => getCursorHover();
}
