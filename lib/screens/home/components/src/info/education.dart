import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/core/cursor_hover/index.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  bool _onAmirkabirTitleHover = false;

  void _onAmirkabirTitleHovered(bool value) =>
      setState(() => _onAmirkabirTitleHover = value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RotatedBox(
              quarterTurns: isFarsiLocale(context) ? 1 : 3,
              child: Text(
                localizations.amirkabirStudyStart,
                style: theme.textTheme.bodyText2,
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        localizations.amirkabirTitle,
                        textScaleFactor: 2.0,
                        style: theme.textTheme.caption.copyWith(
                          color: theme.primaryColor,
                          decoration: _onAmirkabirTitleHover
                              ? TextDecoration.underline
                              : null,
                        ),
                      ).showCursorOnHover(CursorType.pointer,
                          onHovered: _onAmirkabirTitleHovered),
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
                    Text(
                      localizations.amirkabirStudyFieldTitle,
                      style: theme.textTheme.bodyText2,
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
            ),
            RotatedBox(
              quarterTurns: isFarsiLocale(context) ? 3 : 1,
              child: Text(
                localizations.amirkabirStudyEnd,
                style: theme.textTheme.bodyText2,
              ),
            ),
          ],
        ),
        Divider(color: theme.primaryColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RotatedBox(
              quarterTurns: isFarsiLocale(context) ? 1 : 3,
              child: Text(
                localizations.schoolStudyStart,
                style: theme.textTheme.bodyText2,
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      localizations.schoolTitle,
                      textScaleFactor: 2.0,
                      style: theme.textTheme.caption.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                    Text(
                      localizations.schoolCity,
                      style: theme.textTheme.bodyText2,
                    ),
                    Text(
                      localizations.schoolStudyFieldTitle,
                      style: theme.textTheme.bodyText2,
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
            ),
            RotatedBox(
              quarterTurns: isFarsiLocale(context) ? 3 : 1,
              child: Text(
                localizations.schoolStudyEnd,
                style: theme.textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
