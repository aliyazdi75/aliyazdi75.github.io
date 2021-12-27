import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/data/icons.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

class _SocialItem {
  const _SocialItem({required this.icon, required this.url});

  final IconData icon;
  final String url;
}

class Socials extends StatelessWidget {
  Socials({Key? key}) : super(key: key);

  final List<_SocialItem> socialItems = <_SocialItem>[
    const _SocialItem(icon: MySiteIcons.email, url: emailUrl),
    const _SocialItem(icon: MySiteIcons.linkedin, url: linkedinUrl),
    const _SocialItem(icon: MySiteIcons.github, url: githubUrl),
    const _SocialItem(icon: MySiteIcons.twitter, url: twitterUrl),
    const _SocialItem(icon: MySiteIcons.discord, url: discordUrl),
    const _SocialItem(icon: MySiteIcons.telegram, url: telegramUrl),
    const _SocialItem(icon: MySiteIcons.instagram, url: instagramUrl),
    const _SocialItem(icon: MySiteIcons.blogger, url: bloggerUrl),
    const _SocialItem(icon: MySiteIcons.youtube, url: youtubeUrl),
    const _SocialItem(icon: MySiteIcons.twitch, url: twitchUrl),
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
            return OutlinedButton(
              onPressed: () async => _onPressed(socialItems[index].url),
              child: Icon(socialItems[index].icon),
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
