import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_site/layout/adaptive.dart';

import 'components/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    final adaptiveBody = Scrollbar(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: AdaptiveSize(
                  large: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Avatar(),
                          SizedBox(height: 15.0),
                          Name(),
                          SizedBox(height: 15.0),
                          Socials(),
                        ],
                      ),
                      Container(height: 200, child: VerticalDivider()),
                      Info(),
                    ],
                  ),
                  medium: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Avatar(),
                      SizedBox(height: 15.0),
                      Name(),
                      SizedBox(height: 15.0),
                      Socials(),
                      SizedBox(height: 15.0),
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
          );
        },
      ),
    );

    final bodyWidget = AnimatedPadding(
      duration: Duration(milliseconds: 750),
      padding: EdgeInsets.all(shortestSide * 0.1),
      child: Stack(
        fit: StackFit.expand,
        children: [
          adaptiveBody,
        ],
      ),
    );

    return AdaptiveDesign(
      material: Scaffold(
        body: bodyWidget,
      ),
      cupertino: CupertinoPageScaffold(
        child: bodyWidget,
      ),
    );
  }
}
