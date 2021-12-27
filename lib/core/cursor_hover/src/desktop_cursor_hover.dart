import 'cursor_hover_interface.dart';

class DesktopHover implements CursorHover {
  DesktopHover();

  @override
  void onHover(String cursorType) => () {};

  @override
  void onExit() => () {};
}

CursorHover getCursorHover() => DesktopHover();
