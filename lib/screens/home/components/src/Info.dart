import 'package:flutter/material.dart';
import 'package:my_site/layout/adaptive.dart';

import 'about.dart';
import 'education.dart';
import 'experience.dart';

const kInfoLargeScreenHeightFactor = 900000;
const kInfoMediumScreenHeightFactor = 300000;

class Info extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 0);
  final infoItems = [About(), Education(), Experience()];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AdaptiveSize(
      large: Container(
        constraints: BoxConstraints(
          maxHeight: kInfoLargeScreenHeightFactor / screenWidth,
          maxWidth: screenWidth / 3,
        ),
        child: PageView(
          controller: pageController,
          physics: BouncingScrollPhysics(),
          allowImplicitScrolling: true,
          children: List.generate(infoItems.length, (int index) {
            return SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: infoItems[index],
            );
          }),
        ),
      ),
      medium: Container(
        constraints: BoxConstraints(
            maxHeight: kInfoMediumScreenHeightFactor / screenWidth),
        child: PageView(
          controller: pageController,
          physics: BouncingScrollPhysics(),
          allowImplicitScrolling: true,
          children: List.generate(infoItems.length, (int index) {
            return SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: infoItems[index],
            );
          }),
        ),
      ),
    );
  }
}
