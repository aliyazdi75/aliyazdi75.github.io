import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/my_site_localizations.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/core/cursor_hover/index.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

import 'fab.dart';
import 'helper.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool _onFlutterTitleHover = false;

  void _onFlutterTitleHovered(bool value) =>
      setState(() => _onFlutterTitleHover = value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context)!;

    final flutterText = localizations.flutterTitle;
    final byTitle = localizations.byTitle(flutterText);
    final flutterIndex = byTitle.indexOf(flutterText);
    final byText = byTitle.substring(0, flutterIndex);

    return AdaptiveSize(
      large: DecoratedBox(
        decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Theme.of(context).dividerColor)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const SizedBox(width: 10.0),
            Expanded(
              child: Wrap(
                children: [
                  Text(
                    localizations.madeWith,
                    style: theme.textTheme.subtitle1,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 5.0, left: 5.0),
                    child: Icon(
                      Icons.favorite,
                      size: 20.0,
                    ),
                  ),
                  Text(
                    byText,
                    style: theme.textTheme.subtitle1,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (await canLaunch(flutterWebsite)) {
                        await launch(flutterWebsite);
                      }
                    },
                    child: Text(
                      flutterText,
                      style: theme.textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: _onFlutterTitleHover
                            ? TextDecoration.underline
                            : null,
                      ),
                    ).showCursorOnHover(
                      SystemMouseCursors.click,
                      onHovered: _onFlutterTitleHovered,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Helper.getDownloadIcon(),
              onPressed: () => Helper.onPressedDownload(),
            ),
            IconButton(
              icon: Helper.getThemeIcon(context),
              onPressed: () => setState(() => Helper.onThemeChanged(context)),
            ),
            IconButton(
              icon: Helper.getLocaleIcon(context),
              onPressed: () => setState(() => Helper.onLocalChanged(context)),
            ),
          ],
        ),
      ),
      medium: const Fab(),
    );
  }
}
