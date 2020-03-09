import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:my_site/layout/adaptive.dart';

import 'avatar.dart';
import 'socials.dart';

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.caption;
    final screenWidth = MediaQuery.of(context).size.width;

    final name = Column(
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
    return AdaptiveSize(
      large: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Avatar(),
          SizedBox(height: 15.0),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: screenWidth / 3),
            child: name,
          ),
          SizedBox(height: 15.0),
          Socials(),
        ],
      ),
      medium: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Socials(),
                Avatar(),
                SizedBox(width: 50.0),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          name,
        ],
      ),
    );
  }
}
