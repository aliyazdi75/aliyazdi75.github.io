import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bodyTextStyle =
        textTheme.bodyText1.apply(color: colorScheme.onPrimary);

    final welcomeTitle = MySiteLocalizations.of(context).welcomeTitle;
    final aboutUniversityRank =
        MySiteLocalizations.of(context).aboutUniversityRank;
    final aboutMe =
        MySiteLocalizations.of(context).aboutMe(aboutUniversityRank);
    final aboutUniversityRankIndex = aboutMe.indexOf(aboutUniversityRank);
    final samplesRepoIndexEnd =
        aboutUniversityRankIndex + aboutUniversityRank.length;
    final aboutMeFirst = aboutMe.substring(0, aboutUniversityRankIndex);
    final aboutMeSecond = aboutMe.substring(samplesRepoIndexEnd);

    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            welcomeTitle,
            textScaleFactor: 2,
            style: bodyTextStyle.copyWith(
              color: colorScheme.primary,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  style: bodyTextStyle,
                  text: aboutMeFirst,
                ),
                TextSpan(
                  style: bodyTextStyle.copyWith(
                    color: colorScheme.primary,
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
                  style: bodyTextStyle,
                  text: aboutMeSecond,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                shape: StadiumBorder(),
                child: Text("Resume"),
                color: Colors.red,
                padding: EdgeInsets.all(10),
                onPressed: () async {
                  if (await canLaunch(cvUrl)) {
                    await launch(
                      cvUrl,
                      forceSafariVC: false,
                    );
                  }
                },
              ),
              SizedBox(
                width: 20,
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                shape: StadiumBorder(),
                child: Text("Say Hi!"),
                color: Colors.red,
                padding: EdgeInsets.all(10),
                onPressed: () async {
                  if (await canLaunch(cvUrl)) {
                    await launch(
                      cvUrl,
                      forceSafariVC: false,
                    );
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
