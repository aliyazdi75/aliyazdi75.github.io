import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;

    return CircleAvatar(
      radius: shortestSide / 5.5,
      backgroundImage: const AssetImage(avatarPath),
    );
  }
}
