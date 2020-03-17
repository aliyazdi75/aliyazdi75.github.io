import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/l10n/my_site_localizations.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

const kAwardsLargeHeightFactor = 5e5;
const kAwardsMediumHeightFactor = 2e5;

class Awards extends StatefulWidget {
  @override
  _AwardsState createState() => _AwardsState();
}

class _AwardsState extends State<Awards> {
  bool _onTarafdariTitleHover = false;

  void _onTarafdariTitleHovered(bool value) =>
      setState(() => _onTarafdariTitleHover = value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    final bestAppLink = localizations.bestAppLink;
    final bestAppDescription = localizations.bestAppDescription(bestAppLink);
    final bestAppDescriptionIndex = bestAppDescription.indexOf(bestAppLink);
    final bestAppDescriptionIndexEnd =
        bestAppDescriptionIndex + bestAppLink.length;
    final bestAppDescriptionFirst =
        bestAppDescription.substring(0, bestAppDescriptionIndex);
    final bestAppDescriptionSecond =
        bestAppDescription.substring(bestAppDescriptionIndexEnd);

    Widget _alignment(Widget child) {
      return isLargeDisplay(context)
          ? Center(child: child)
          : Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                child,
              ],
            );
    }

    Widget _constraint(Widget child) {
      return Container(
        constraints: isLargeDisplay(context)
            ? BoxConstraints(maxHeight: kAwardsLargeHeightFactor / screenWidth)
            : BoxConstraints(
                maxHeight: kAwardsMediumHeightFactor / screenWidth),
        child: child,
      );
    }

    Widget _items(List<Widget> children) {
      return _constraint(
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      );
    }

    Widget _dateText(String text) {
      return Text(
        text,
        style: theme.textTheme.bodyText1,
        textScaleFactor: 1.5,
      );
    }

    Widget _descriptionText(String text) {
      return Text(
        text,
        style: theme.textTheme.bodyText2,
      );
    }

    return _alignment(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _items(
            [
              _dateText(localizations.bestAppDate),
              _dateText(localizations.examDate),
              _dateText(localizations.olympiadDate),
            ],
          ),
          SizedBox(width: 10.0),
          _constraint(
            RotatedBox(
              quarterTurns: 1,
              child: SliderTheme(
                data: SliderThemeData(
                  activeTickMarkColor: theme.primaryColor,
                  tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 5.0),
                  thumbShape: RoundSliderThumbShape(disabledThumbRadius: 0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                  disabledActiveTickMarkColor: Colors.grey,
                ),
                child: Slider.adaptive(
                  value: 1,
                  divisions: 2,
                  onChanged: null,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: _items(
              [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        style: theme.textTheme.bodyText2,
                        text: bestAppDescriptionFirst,
                      ),
                      TextSpan(
                        style: theme.textTheme.bodyText2
                            .copyWith(color: theme.primaryColor),
                        text: bestAppLink,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            if (await canLaunch(iwmfWebsite)) {
                              await launch(
                                iwmfWebsite,
                                forceWebView: true,
                              );
                            }
                          },
                      ),
                      TextSpan(
                        style: theme.textTheme.bodyText2,
                        text: bestAppDescriptionSecond,
                      ),
                    ],
                  ),
                ),
                _descriptionText(localizations.examDescription),
                _descriptionText(localizations.olympiadDescription),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
