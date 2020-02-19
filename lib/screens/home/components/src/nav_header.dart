import 'package:flutter/material.dart';
import 'package:my_site/layout/adaptive.dart';

import 'pk_dot.dart';

class NavHeader extends StatelessWidget {
  final List<Widget> navButtons;

  const NavHeader({Key key, this.navButtons}) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSmallDisplay(context)
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        PKDot(),
//          Spacer(),
        if (!isSmallDisplay(context))
          Row(
            children: navButtons,
          )
      ],
    );
  }
}
