import 'package:flutter/material.dart';
import 'package:my_site/layout/adaptive.dart';

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
    return Scaffold(
      drawer: isSmallDisplay(context)
          ? Drawer(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: navButtons(),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: AnimatedPadding(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              NavHeader(navButtons: navButtons()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              ProfileInfo(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Socials(),
            ],
          ),
        ),
      ),
    );
  }
}
