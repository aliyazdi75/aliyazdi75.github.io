import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_site/core/constants/index.dart';
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
    const _SocialItem(icon: MySiteIcons.email, url: emailUrl),
    const _SocialItem(icon: MySiteIcons.linkedin, url: linkedinUrl),
    const _SocialItem(icon: MySiteIcons.github, url: githubUrl),
    const _SocialItem(icon: MySiteIcons.twitter, url: twitterUrl),
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
              onPressed: () async => _onPressed(socialItems[index].url),
            );
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
                padding: const EdgeInsets.all(0.0),
                color: theme.brightness == Brightness.light
                    ? theme.primaryColor
                    : null,
                onPressed: () async => _onPressed(socialItems[index].url),
              ),
            );
          }),
        ),
      ),
    );
  }

  Future<void> _onPressed(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
