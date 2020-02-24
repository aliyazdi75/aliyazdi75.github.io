import 'package:flutter/material.dart';
import 'package:my_site/l10n/my_site_localizations.dart';

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.caption;

    return Column(
      children: <Widget>[
        Text(
          MySiteLocalizations.of(context).myName,
          style: textTheme,
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
        ),
        Text(
          MySiteLocalizations.of(context).myTitle,
          style: textTheme,
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
        ),
      ],
    );
  }
}
