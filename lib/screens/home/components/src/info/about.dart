import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/core/cursor_hover/cursor_hover_interface.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool _onMouseHover = false;

  void _onHovered(bool value) => setState(() => _onMouseHover = value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context);

    final aboutUniversityRank = localizations.aboutUniversityRank;
    final aboutMe = localizations.aboutMe(aboutUniversityRank);
    final aboutUniversityRankIndex = aboutMe.indexOf(aboutUniversityRank);
    final samplesRepoIndexEnd =
        aboutUniversityRankIndex + aboutUniversityRank.length;
    final aboutMeFirst = aboutMe.substring(0, aboutUniversityRankIndex);
    final aboutMeSecond = aboutMe.substring(samplesRepoIndexEnd);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CursorHover(
          onHovered: _onHovered,
          child: Text(
            MySiteLocalizations.of(context).welcomeTitle,
            style: theme.textTheme.caption.copyWith(
              color: theme.primaryColor,
              decoration: _onMouseHover ? TextDecoration.underline : null,
            ),
            textScaleFactor: 4.0,
          ),
        ),
        Divider(color: Theme.of(context).primaryColor),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                style: theme.textTheme.bodyText2,
                text: aboutMeFirst,
              ),
              TextSpan(
                style: theme.textTheme.bodyText2.copyWith(
                  color: theme.primaryColor,
                  decoration: TextDecoration.underline,
                ),
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
                style: theme.textTheme.bodyText2,
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
  }
}
