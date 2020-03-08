import 'cursor_hover_interface.dart';

class DesktopHover implements CursorHover {
  DesktopHover();

  @override
  void onHover() => null;

  @override
  void onExit() => null;
}

CursorHover getCursorHover() => DesktopHover();
