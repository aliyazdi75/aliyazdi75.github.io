import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:my_site/screens/home/components/src/menu/menu.dart';

import 'components/index.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final contentPadding = shortestSide * 0.05;

    final adaptiveBody = Center(
      child: SingleChildScrollView(
        child: SafeArea(
          child: AnimatedPadding(
            duration: Duration(milliseconds: 750),
            padding: isMediumDisplay(context)
                ? EdgeInsets.fromLTRB(
                    contentPadding, contentPadding, contentPadding, 0)
                : EdgeInsets.all(0),
            child: AdaptiveSize(
              large: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Name(),
                  Container(
                    height: 200,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          left:
                              BorderSide(color: Theme.of(context).dividerColor),
                        ),
                      ),
                    ),
                  ),
                  Info(),
                ],
              ),
              medium: Column(
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
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: true,
        floatingActionButton: isMediumDisplay(context) ? Menu() : null,
        bottomNavigationBar: isLargeDisplay(context) ? Menu() : null,
      ),
      cupertino: CupertinoPageScaffold(
        child: adaptiveBody,
      ),
    );
  }
}
