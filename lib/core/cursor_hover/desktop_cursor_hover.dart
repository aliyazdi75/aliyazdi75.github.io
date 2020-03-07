import 'cursor_hover_interface.dart';

class DesktopHover implements Cursor {
  DesktopHover();

  @override
  void onHover() => null;

  @override
  void onExit() => null;
}

Cursor getCursorHover() => DesktopHover();
