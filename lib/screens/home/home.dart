import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:my_site/screens/home/components/src/avatar.dart';

import 'components/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  List<Widget> navButtons() => [
        NavButton(
          text: "about",
          onPressed: () {},
        ),
        NavButton(
          text: "work",
          onPressed: () {},
        ),
        NavButton(
          text: "contact",
          onPressed: () {},
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final Widget bodyWidget = AnimatedPadding(
      duration: Duration(seconds: 1),
      padding: EdgeInsets.all(screenHeight * 0.1),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//          NavHeader(navButtons: navButtons()),
                  Avatar(),
                  SizedBox(height: 15.0),
                  Socials(),
                ],
              ),
              Info(),
            ],
          ),
        ],
      ),
    );

    return AdaptiveDesign(
      material: Scaffold(
        drawer: isMediumDisplay(context)
            ? Drawer(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: navButtons(),
                ),
              )
            : null,
        body: bodyWidget,
      ),
      cupertino: CupertinoPageScaffold(
        child: bodyWidget,
      ),
    );
  }
}
