import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'helper.dart';

class Fab extends StatefulWidget {
  const Fab({Key? key}) : super(key: key);

  @override
  _FabState createState() => _FabState();
}

class _FabState extends State<Fab> with TickerProviderStateMixin {
  final double fabHeight = 56.0;

  late AnimationController _animationController;
  Animation<Color?>? _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;
  bool _isOpened = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addListener(() => setState(() {}));
    _animateIcon = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    _translateButton = Tween<double>(
      begin: fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _buttonColor = ColorTween(
        begin: null,
        end: Theme.of(context).primaryColor,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ));
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _fabIcon(double translateFactor, Widget fab) {
      return Transform(
        transform: Matrix4.translationValues(
          0.0,
          _translateButton.value * translateFactor,
          0.0,
        ),
        child: fab,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _fabIcon(
          3.0,
          FloatingActionButton(
            elevation: 0.0,
            onPressed: () => setState(() => Helper.onLocalChanged(context)),
            child: Helper.getLocaleIcon(context),
          ),
        ),
        _fabIcon(
          2.0,
          FloatingActionButton(
            elevation: 0.0,
            onPressed: () => setState(() => Helper.onThemeChanged(context)),
            child: Helper.getThemeIcon(context),
          ),
        ),
        _fabIcon(
          1.0,
          FloatingActionButton(
            elevation: 0.0,
            onPressed: () => Helper.onPressedDownload(),
            child: Helper.getDownloadIcon(),
          ),
        ),
        FloatingActionButton(
          backgroundColor: _buttonColor?.value,
          onPressed: () {
            if (_isOpened) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            _isOpened = !_isOpened;
          },
          child: AnimatedIcon(
            color: _isOpened ? Colors.white : null,
            icon: AnimatedIcons.menu_close,
            progress: _animateIcon,
          ),
        ),
      ],
    );
  }
}
