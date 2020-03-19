import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/core/cursor_hover/index.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context);

    final aboutUniversityRank = localizations.aboutUniversityRank;
    final aboutMe = localizations.aboutMe(aboutUniversityRank);
    final aboutUniversityRankIndex = aboutMe.indexOf(aboutUniversityRank);
    final aboutUniversityRankIndexEnd =
        aboutUniversityRankIndex + aboutUniversityRank.length;
    final aboutMeFirst = aboutMe.substring(0, aboutUniversityRankIndex);
    final aboutMeSecond = aboutMe.substring(aboutUniversityRankIndexEnd);

    return Column(
      mainAxisAlignment: isMediumDisplay(context)
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          localizations.welcomeTitle,
          textScaleFactor: 4.0,
          style: theme.textTheme.caption.copyWith(color: theme.primaryColor),
        ),
        Divider(color: theme.primaryColor),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                style: theme.textTheme.bodyText2,
                text: aboutMeFirst,
              ),
              TextSpan(
                style: theme.textTheme.bodyText2
                    .copyWith(color: theme.primaryColor),
                text: aboutUniversityRank,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    if (await canLaunch(topRankUniversity)) {
                      await launch(
                        topRankUniversity
                      );
                    }
                  },
              ),
              TextSpan(
                style: theme.textTheme.bodyText2,
                text: aboutMeSecond,
              ),
            ],
          ),
          textAlign: TextAlign.justify,
          textScaleFactor: 1.5,
        ),
        SizedBox(height: 20.0),
        RaisedButton(
          shape: StadiumBorder(),
          child: Text(localizations.resume),
          onPressed: () async {
            if (await canLaunch(cvUrl)) {
              await launch(
                cvUrl,
                forceSafariVC: false,
              );
            }
          },
        ).showCursorOnHover(CursorType.pointer),
      ],
    );
  }
}
