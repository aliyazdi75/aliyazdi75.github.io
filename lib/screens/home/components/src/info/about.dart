import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/my_site_localizations.dart';
import 'package:my_site/core/constants/index.dart';
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
        Text(
          localizations.aboutMe,
          textScaleFactor: 1.5,
          textAlign: TextAlign.justify,
          style: theme.textTheme.bodyText2.copyWith(),
        ),
        // Text.rich(
        //   TextSpan(
        //     children: [
        //       TextSpan(
        //         style: theme.textTheme.bodyText2,
        //         text: aboutMe,
        //       ),
        //       TextSpan(
        //         style: theme.textTheme.bodyText2
        //             .copyWith(color: theme.primaryColor),
        //         text: aboutUniversityRank,
        //         recognizer: TapGestureRecognizer()
        //           ..onTap = () async {
        //             if (await canLaunch(topRankUniversity)) {
        //               await launch(topRankUniversity);
        //             }
        //           },
        //       ),
        //       TextSpan(
        //         style: theme.textTheme.bodyText2,
        //         text: aboutMeSecond,
        //       ),
        //     ],
        //   ),
        //   textAlign: TextAlign.justify,
        //   textScaleFactor: 1.5,
        // ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
          child: Text(
            localizations.resume,
            style: const TextStyle(color: Colors.white),
          ),
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
