import 'package:flutter/material.dart';
import 'package:my_site/core/urls.dart';
import 'package:url_launcher/url_launcher.dart';

import 'nav_button.dart';
import 'responsive_widget.dart';

class Socials extends StatelessWidget {
  List<Widget> socialMediaWidgets() {
    return [
      NavButton(
        text: "Email",
        color: Colors.blue,
        onPressed: () async {
          if (await canLaunch(emailUrl)) {
            await launch(
              emailUrl,
              forceSafariVC: false,
            );
          }
        },
      ),
      NavButton(
        text: "Linkedin",
        color: Colors.blue,
        onPressed: () async {
          if (await canLaunch(linkedinUrl)) {
            await launch(
              linkedinUrl,
              forceSafariVC: false,
            );
          }
        },
      ),
      NavButton(
        text: "Github",
        color: Colors.blue,
        onPressed: () async {
          if (await canLaunch(githubUrl)) {
            await launch(
              githubUrl,
              forceSafariVC: false,
            );
          }
        },
      ),
      NavButton(
        text: "Twitter",
        color: Colors.blue,
        onPressed: () async {
          if (await canLaunch(twitterUrl)) {
            await launch(
              twitterUrl,
              forceSafariVC: false,
            );
          }
        },
      ),
    ];
  }

  Widget copyRightText() => Text(
        "Pawan Kumar ©️2019",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}
