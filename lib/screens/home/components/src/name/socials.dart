import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/my_site_localizations.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/data/icons.dart';
import 'package:url_launcher/url_launcher.dart';

class _SocialItem {
  const _SocialItem({
    required this.icon,
    required this.name,
    required this.url,
  });

  final IconData icon;
  final String name;
  final String url;
}

class Socials extends StatelessWidget {
  const Socials({Key? key}) : super(key: key);

  List<_SocialItem> socialItems(BuildContext context) => <_SocialItem>[
        _SocialItem(
          name: MySiteLocalizations.of(context)!.email,
          icon: MySiteIcons.email,
          url: emailUrl,
        ),
        _SocialItem(
          name: MySiteLocalizations.of(context)!.linkedin,
          icon: MySiteIcons.linkedin,
          url: linkedinUrl,
        ),
        _SocialItem(
          name: MySiteLocalizations.of(context)!.github,
          icon: MySiteIcons.github,
          url: githubUrl,
        ),
        _SocialItem(
          name: MySiteLocalizations.of(context)!.twitter,
          icon: MySiteIcons.twitter,
          url: twitterUrl,
        ),
        _SocialItem(
          name: MySiteLocalizations.of(context)!.discord,
          icon: MySiteIcons.discord,
          url: discordUrl,
        ),
        _SocialItem(
          name: MySiteLocalizations.of(context)!.telegram,
          icon: MySiteIcons.telegram,
          url: telegramUrl,
        ),
        _SocialItem(
          name: MySiteLocalizations.of(context)!.instagram,
          icon: MySiteIcons.instagram,
          url: instagramUrl,
        ),
        _SocialItem(
          name: MySiteLocalizations.of(context)!.blogger,
          icon: MySiteIcons.blogger,
          url: bloggerUrl,
        ),
        _SocialItem(
            name: MySiteLocalizations.of(context)!.medium,
            icon: MySiteIcons.medium,
            url: mediumUrl),
        _SocialItem(
          name: MySiteLocalizations.of(context)!.youtube,
          icon: MySiteIcons.youtube,
          url: youtubeUrl,
        ),
        _SocialItem(
          name: MySiteLocalizations.of(context)!.twitch,
          icon: MySiteIcons.twitch,
          url: twitchUrl,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final theme = Theme.of(context);
    final items = socialItems(context);

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.none),
        color: Theme.of(context).splashColor.withOpacity(0.03),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5.0,
        runSpacing: 5.0,
        children: List.generate(items.length, (index) {
          return Tooltip(
            message: items[index].name,
            child: OutlinedButton(
              onPressed: () async => _onPressed(items[index].url),
              child: Icon(items[index].icon),
            ),
          );
        }),
      ),
    );
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    // child: AdaptiveSize(
    //   large: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: List.generate(socialItems.length, (index) {
    //       return OutlinedButton(
    //         onPressed: () async => _onPressed(socialItems[index].url),
    //         child: Icon(socialItems[index].icon),
    //       );
    //     }),
    //   ),
    // medium: Column(
    //   children: List.generate(socialItems.length, (index) {
    //     return Padding(
    //       padding: EdgeInsets.all(
    //         screenWidth / 100.0,
    //       ),
    //       child: IconButton(
    //         icon: Icon(socialItems[index].icon),
    //         iconSize: 30.0,
    //         visualDensity: VisualDensity.compact,
    //         padding: const EdgeInsets.all(0.0),
    //         color: theme.brightness == Brightness.light
    //             ? theme.primaryColor
    //             : null,
    //         onPressed: () async => _onPressed(socialItems[index].url),
    //       ),
    //     );
    //   }),
    // ),
    // ),
    // );
  }

  Future<void> _onPressed(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
