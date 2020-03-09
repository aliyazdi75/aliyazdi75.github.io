import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/core/cursor_hover/index.dart';
import 'package:my_site/data/icons.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

class _SocialItem {
  const _SocialItem({this.icon, this.url});

  final IconData icon;
  final String url;
}

class Socials extends StatelessWidget {
  final List<_SocialItem> socialItems = <_SocialItem>[
    _SocialItem(icon: MySiteIcons.email, url: emailUrl),
    _SocialItem(icon: MySiteIcons.linkedin, url: linkedinUrl),
    _SocialItem(icon: MySiteIcons.github, url: githubUrl),
    _SocialItem(icon: MySiteIcons.twitter, url: twitterUrl),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: AdaptiveSize(
        large: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(socialItems.length, (index) {
            return OutlineButton(
              child: Icon(socialItems[index].icon),
              onPressed: () async {
                if (await canLaunch(socialItems[index].url)) {
                  await launch(
                    socialItems[index].url,
                    forceWebView: true,
                  );
                }
              },
            ).showCursorOnHover(CursorType.pointer);
          }),
        ),
        medium: Column(
          children: List.generate(socialItems.length, (index) {
            return Padding(
              padding: EdgeInsets.all(
                screenWidth / 100.0,
              ),
              child: IconButton(
                icon: Icon(socialItems[index].icon),
                iconSize: 30.0,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.all(0.0),
                color: theme.brightness == Brightness.light
                    ? theme.primaryColor
                    : null,
                onPressed: () async {
                  if (await canLaunch(socialItems[index].url)) {
                    await launch(
                      socialItems[index].url,
                      forceWebView: true,
                    );
                  }
                },
              ).showCursorOnHover(CursorType.pointer),
            );
          }),
        ),
      ),
    );
  }
}
