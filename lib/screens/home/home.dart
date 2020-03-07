import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_site/layout/adaptive.dart';

import 'components/index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    final adaptiveBody = Center(
      child: SingleChildScrollView(
        child: SafeArea(
          child: AnimatedPadding(
            duration: Duration(milliseconds: 750),
            padding: isMediumDisplay(context)
                ? EdgeInsets.all(shortestSide * 0.05)
                : isSmallDisplay(context)
                    ? EdgeInsets.all(0)
                    : EdgeInsets.all(shortestSide * 0.1),
            child: AdaptiveSize(
              large: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Name(),
                  Container(height: 200, child: VerticalDivider()),
                  Info(),
                ],
              ),
              medium: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Name(),
                  Info(),
                ],
              ),
              small: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Avatar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    return AdaptiveDesign(
      material: Scaffold(
        body: adaptiveBody,
      ),
      cupertino: CupertinoPageScaffold(
        child: adaptiveBody,
      ),
    );
  }
}
