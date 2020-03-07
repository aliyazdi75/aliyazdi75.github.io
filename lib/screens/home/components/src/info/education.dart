import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class Education extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: Text(
            localizations.amirkabirTitle,
            style: theme.textTheme.caption.copyWith(color: theme.primaryColor),
            textScaleFactor: 2.0,
          ),
          onTap: () async {
            if (await canLaunch(amirkabirWebsite)) {
              await launch(
                amirkabirWebsite,
                forceWebView: true,
              );
            }
          },
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                style: theme.textTheme.bodyText2,
                text: localizations.polytechnicTitle,
              ),
              TextSpan(
                style: theme.textTheme.bodyText2,
                text: localizations.amirkabirCity,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Divider(color: Theme.of(context).primaryColor),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                style: theme.textTheme.bodyText2
                    .copyWith(color: theme.primaryColor),
                text: localizations.schoolTitle,
              ),
              TextSpan(
                style: theme.textTheme.bodyText2,
                text: localizations.schoolCity,
              ),
            ],
          ),
          textScaleFactor: 1.5,
        ),
      ],
    );
  }
}
