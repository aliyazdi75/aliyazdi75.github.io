import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/my_site_localizations.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/core/cursor_hover/index.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  bool _onAmirkabirTitleHover = false;
  bool _onSchoolTitleHover = false;

  void _onAmirkabirTitleHovered(bool value) =>
      setState(() => _onAmirkabirTitleHover = value);

  void _onSchoolTitleHovered(bool value) =>
      setState(() => _onSchoolTitleHover = value);

  @override
  Widget build(BuildContext context) {
    const itemPadding = 20.0;
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: isMediumDisplay(context)
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
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
              child: Padding(
                padding: const EdgeInsets.all(itemPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        if (await canLaunch(amirkabirWebsite)) {
                          await launch(amirkabirWebsite);
                        }
                      },
                      child: Text(
                        localizations.amirkabirTitle,
                        textScaleFactor: 2.0,
                        style: theme.textTheme.caption!.copyWith(
                          color: theme.primaryColor,
                          decoration: _onAmirkabirTitleHover
                              ? TextDecoration.underline
                              : null,
                        ),
                      ).showCursorOnHover(
                        SystemMouseCursors.click,
                        onHovered: _onAmirkabirTitleHovered,
                      ),
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
              child: Padding(
                padding: const EdgeInsets.all(itemPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        if (await canLaunch(schoolWebsite)) {
                          await launch(schoolWebsite);
                        }
                      },
                      child: Text(
                        localizations.schoolTitle,
                        textScaleFactor: 2.0,
                        style: theme.textTheme.caption!.copyWith(
                          color: theme.primaryColor,
                          decoration: _onSchoolTitleHover
                              ? TextDecoration.underline
                              : null,
                        ),
                      ).showCursorOnHover(
                        SystemMouseCursors.click,
                        onHovered: _onSchoolTitleHovered,
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
