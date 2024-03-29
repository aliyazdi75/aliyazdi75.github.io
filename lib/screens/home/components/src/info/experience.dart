import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/my_site_localizations.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/core/cursor_hover/index.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  bool _onTarafdariTitleHover = false;

  void _onTarafdariTitleHovered(bool value) =>
      setState(() => _onTarafdariTitleHover = value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context)!;

    // Widget _duty(String description) {
    //   return ListTile(
    //     contentPadding: const EdgeInsets.all(0.0),
    //     leading: const Icon(
    //       Icons.lens,
    //       size: 20.0,
    //     ),
    //     title: Text(
    //       description,
    //       style: theme.textTheme.bodyText1,
    //       textScaleFactor: 1.5,
    //     ),
    //   );
    // }

    return Column(
      mainAxisAlignment: isMediumDisplay(context)
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: RotatedBox(
                quarterTurns: isFarsiLocale(context) ? 1 : 3,
                child: Text(
                  localizations.mateMachineWorkStart,
                  style: theme.textTheme.bodyText2,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunch(tarafdariWebsite)) {
                              await launch(tarafdariWebsite);
                            }
                          },
                          child: Text(
                            localizations.mateMachineTitle,
                            textScaleFactor: 2.0,
                            style: theme.textTheme.caption!.copyWith(
                              color: theme.primaryColor,
                              decoration: _onTarafdariTitleHover
                                  ? TextDecoration.underline
                                  : null,
                            ),
                          ).showCursorOnHover(
                            SystemMouseCursors.click,
                            onHovered: _onTarafdariTitleHovered,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            localizations.mateMachineCity,
                            style: theme.textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      localizations.mateMachineTechnologies,
                      style: theme.textTheme.bodyText1,
                    ),
                    Text(
                      localizations.mateMachineDescription,
                      style: theme.textTheme.bodyText1,
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.justify,
                    ),
                    // Divider(color: theme.primaryColor),
                    // _duty(localizations.tarafdariDuty1),
                    // _duty(localizations.tarafdariDuty2),
                    // _duty(localizations.tarafdariDuty3),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: RotatedBox(
                quarterTurns: isFarsiLocale(context) ? 3 : 1,
                child: Text(
                  localizations.mateMachineWorkEnd,
                  style: theme.textTheme.bodyText2,
                ),
              ),
            ),
          ],
        ),
        Divider(color: theme.primaryColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: RotatedBox(
                quarterTurns: isFarsiLocale(context) ? 1 : 3,
                child: Text(
                  localizations.tarafdariWorkStart,
                  style: theme.textTheme.bodyText2,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunch(tarafdariWebsite)) {
                              await launch(tarafdariWebsite);
                            }
                          },
                          child: Text(
                            localizations.tarafdariTitle,
                            textScaleFactor: 2.0,
                            style: theme.textTheme.caption!.copyWith(
                              color: theme.primaryColor,
                              decoration: _onTarafdariTitleHover
                                  ? TextDecoration.underline
                                  : null,
                            ),
                          ).showCursorOnHover(
                            SystemMouseCursors.click,
                            onHovered: _onTarafdariTitleHovered,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            localizations.tarafdariCity,
                            style: theme.textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      localizations.tarafdariTechnologies,
                      style: theme.textTheme.bodyText1,
                    ),
                    Text(
                      localizations.tarafdariDescription,
                      style: theme.textTheme.bodyText1,
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.justify,
                    ),
                    // Divider(color: theme.primaryColor),
                    // _duty(localizations.tarafdariDuty1),
                    // _duty(localizations.tarafdariDuty2),
                    // _duty(localizations.tarafdariDuty3),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: RotatedBox(
                quarterTurns: isFarsiLocale(context) ? 3 : 1,
                child: Text(
                  localizations.tarafdariWorkEnd,
                  style: theme.textTheme.bodyText2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
          onPressed: () async {
            if (await canLaunch(applicationUrl)) {
              await launch(
                applicationUrl,
                forceSafariVC: false,
              );
            }
          },
          child: Text(
            localizations.applicationPage,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
