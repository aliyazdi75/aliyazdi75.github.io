import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

class Education extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final themeContext = Theme.of(context);
    final textTheme = themeContext.textTheme;

    final aboutUniversityRank =
        MySiteLocalizations.of(context).aboutUniversityRank;
    final aboutMe =
        MySiteLocalizations.of(context).aboutMe(aboutUniversityRank);
    final aboutUniversityRankIndex = aboutMe.indexOf(aboutUniversityRank);
    final samplesRepoIndexEnd =
        aboutUniversityRankIndex + aboutUniversityRank.length;
    final aboutMeFirst = aboutMe.substring(0, aboutUniversityRankIndex);
    final aboutMeSecond = aboutMe.substring(samplesRepoIndexEnd);

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text.rich(
          TextSpan(
            text: MySiteLocalizations.of(context).welcomeTitle,
            style: textTheme.caption.copyWith(
              color: themeContext.primaryColor,
            ),
          ),
          textScaleFactor: 4.0,
        ),
        Divider(color: Theme.of(context).primaryColor),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                style: textTheme.bodyText2,
                text: aboutMeFirst,
              ),
              TextSpan(
                style: textTheme.bodyText2
                    .copyWith(color: themeContext.primaryColor),
                text: aboutUniversityRank,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    if (await canLaunch(topRankUniversity)) {
                      await launch(
                        topRankUniversity,
                        forceWebView: true,
                      );
                    }
                  },
              ),
              TextSpan(
                style: textTheme.bodyText2,
                text: aboutMeSecond,
              ),
            ],
          ),
          textAlign: TextAlign.justify,
          textScaleFactor: 1.5,
        ),
        SizedBox(height: 20),
        RaisedButton(
          shape: StadiumBorder(),
          child: Text(MySiteLocalizations.of(context).resume),
          onPressed: () async {
            if (await canLaunch(cvUrl)) {
              await launch(
                cvUrl,
                forceSafariVC: false,
              );
            }
          },
        ),
      ],
    );

    return AdaptiveSize(
      large: Container(
        constraints: BoxConstraints(maxWidth: screenWidth / 3),
        child: info,
      ),
      medium: info,
    );
  }
}
