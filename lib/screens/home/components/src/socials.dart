import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/data/icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Socials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlineButton(
            child: Icon(MySiteIcons.email),
            onPressed: () async {
              if (await canLaunch(emailUrl)) {
                await launch(
                  emailUrl,
                  forceWebView: true,
                );
              }
            },
          ),
          OutlineButton(
            child: Icon(MySiteIcons.linkedin),
            onPressed: () async {
              if (await canLaunch(linkedinUrl)) {
                await launch(
                  linkedinUrl,
                  forceWebView: true,
                );
              }
            },
          ),
          OutlineButton(
            child: Icon(MySiteIcons.github),
            onPressed: () async {
              if (await canLaunch(githubUrl)) {
                await launch(
                  githubUrl,
                  forceWebView: true,
                );
              }
            },
          ),
          OutlineButton(
            child: Icon(MySiteIcons.twitter),
            onPressed: () async {
              if (await canLaunch(twitterUrl)) {
                await launch(
                  twitterUrl,
                  forceWebView: true,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
