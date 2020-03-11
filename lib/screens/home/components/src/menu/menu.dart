import 'package:flutter/material.dart';
import 'package:my_site/core/cursor_hover/index.dart';
import 'package:my_site/data/icons.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:my_site/layout/adaptive.dart';

import 'fab.dart';
import 'helper.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context);

    return AdaptiveSize(
      large: DecoratedBox(
        decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Theme.of(context).dividerColor)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(width: 10.0),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      style: theme.textTheme.subtitle1,
                      text: localizations.madeWith,
                    ),
                    TextSpan(
                      style: theme.textTheme.subtitle1.copyWith(
                        fontFamily: MySiteIcons.heart.fontFamily,
                      ),
                      //It's not working on Linux
                      //'Made with \u2665 by Flutter',
                      text:
                          ' ${String.fromCharCode(MySiteIcons.heart.codePoint)} ',
                    ),
                    TextSpan(
                      style: theme.textTheme.subtitle1,
                      text: localizations.byFlutter,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Helper.getDownloadIcon(),
              onPressed: () => Helper.onPressedDownload(),
            ).showCursorOnHover(CursorType.pointer),
            IconButton(
              icon: Helper.getThemeIcon(context),
              onPressed: () => setState(() => Helper.onThemeChanged(context)),
            ).showCursorOnHover(CursorType.pointer),
            IconButton(
              icon: Helper.getLocaleIcon(context),
              onPressed: () => setState(() => Helper.onLocalChanged(context)),
            ).showCursorOnHover(CursorType.pointer),
          ],
        ),
      ),
      medium: Fab(),
    );
  }
}
