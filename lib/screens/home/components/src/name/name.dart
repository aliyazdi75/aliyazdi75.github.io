import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/my_site_localizations.dart';

import 'avatar.dart';
import 'donates.dart';
import 'socials.dart';

class Name extends StatelessWidget {
  const Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.caption;

    final name = Column(
      children: <Widget>[
        Text(
          MySiteLocalizations.of(context)!.myName,
          style: textTheme,
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
        ),
        Text(
          MySiteLocalizations.of(context)!.myTitle,
          style: textTheme,
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
        ),
      ],
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Avatar(),
        const SizedBox(height: 15.0),
        name,
        const SizedBox(height: 15.0),
        const Socials(),
        const SizedBox(height: 15.0),
        Text(
          MySiteLocalizations.of(context)!.support,
          style: textTheme,
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
        ),
        const SizedBox(height: 15.0),
        const Donates(),
      ],
    );
    // return AdaptiveSize(
    //   large: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       const Avatar(),
    //       const SizedBox(height: 15.0),
    //       ConstrainedBox(
    //         constraints: BoxConstraints(maxWidth: screenWidth / 3),
    //         child: name,
    //       ),
    //       const SizedBox(height: 15.0),
    //       Socials(),
    //     ],
    //   ),
    //   medium: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         child: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: <Widget>[
    //             Socials(),
    //             const Avatar(),
    //             const SizedBox(width: 50.0),
    //           ],
    //         ),
    //       ),
    //       const SizedBox(height: 15.0),
    //       name,
    //     ],
    //   ),
    // );
  }
}
