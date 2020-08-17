import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_site/core/cursor_hover/index.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:my_site/layout/adaptive.dart';

import 'about.dart';
import 'awards.dart';
import 'education.dart';
import 'experience.dart';
import 'slider.dart';

const kInfoLargeScreenHeightFactor = 1e6;
const kInfoSliderHeightFactor = 85e4;
const kInfoMediumScreenHeightFactor = 39e4;
const kPageAnimationDuration = Duration(milliseconds: 200);

class _InfoItem {
  _InfoItem({this.icon, this.info});

  final IconData icon;
  final Widget info;

  String title;
}

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final materialFont = 'MaterialIcons';
  final List<_InfoItem> infoItems = <_InfoItem>[
    _InfoItem(icon: Icons.description, info: About()),
    _InfoItem(icon: Icons.school, info: Education()),
    _InfoItem(icon: Icons.work, info: Experience()),
    _InfoItem(icon: Icons.emoji_events, info: Awards()),
  ];

  PageController _pageController;
  double _discreteSliderValue = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context);

    infoItems[0].title = localizations.aboutTitle;
    infoItems[1].title = localizations.educationTitle;
    infoItems[2].title = localizations.experienceTitle;
    infoItems[3].title = localizations.awardsTitle;

    return AdaptiveSize(
      large: Row(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: kInfoLargeScreenHeightFactor / screenWidth,
              maxWidth: screenWidth / 3,
            ),
            child: PageView(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              allowImplicitScrolling: true,
              onPageChanged: (page) {
                setState(() {
                  _discreteSliderValue = page.toDouble();
                });
              },
              children: List.generate(infoItems.length, (index) {
                return infoItems[index].info;
              }),
            ).showCursorOnHover(SystemMouseCursors.grab),
          ),
          Container(
            constraints: BoxConstraints(
                maxHeight: kInfoSliderHeightFactor / screenWidth),
            child: RotatedBox(
              quarterTurns: isFarsiLocale(context) ? 3 : 1,
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 2.0,
                  activeTickMarkColor: theme.primaryColor,
                  tickMarkShape:
                      const RoundSliderTickMarkShape(tickMarkRadius: 3.5),
                  thumbShape: CustomThumbShape(),
                  valueIndicatorShape: CustomValueIndicatorShape(),
                  valueIndicatorTextStyle: theme.textTheme.headline6.copyWith(
                    fontSize: 30.0,
                    color: theme.primaryColor,
                    fontFamily: materialFont,
                  ),
                ),
                child: Slider.adaptive(
                  value: _discreteSliderValue,
                  min: 0.0,
                  max: infoItems.length - 1.0,
                  divisions: infoItems.length - 1,
                  semanticFormatterCallback: (value) =>
                      value.round().toString(),
                  label: String.fromCharCode(
                    infoItems[_discreteSliderValue.round()].icon.codePoint,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _discreteSliderValue = value;
                      _pageController.animateToPage(
                        value.round(),
                        duration: kPageAnimationDuration,
                        curve: Curves.easeInOut,
                      );
                    });
                  },
                ).showCursorOnHover(SystemMouseCursors.grab),
              ),
            ),
          ),
        ],
      ),
      medium: DefaultTabController(
        length: infoItems.length,
        child: Column(
          children: <Widget>[
            TabBar(
              isScrollable: true,
              indicatorColor: theme.primaryColor,
              tabs: infoItems.map<Tab>((item) {
                return Tab(text: item.title, icon: Icon(item.icon, size: 30.0));
              }).toList(),
            ),
            Container(
              constraints: BoxConstraints(
                  maxHeight: kInfoMediumScreenHeightFactor / screenWidth),
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: infoItems.map<Widget>((item) {
                  return item.info;
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
