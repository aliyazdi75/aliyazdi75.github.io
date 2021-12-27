import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/my_site_localizations.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/layout/adaptive.dart';
import 'package:url_launcher/url_launcher.dart';

const kAwardsLargeHeightFactor = 60e4;
const kAwardsMediumHeightFactor = 28e4;

class Awards extends StatefulWidget {
  const Awards({Key? key}) : super(key: key);

  @override
  _AwardsState createState() => _AwardsState();
}

class _AwardsState extends State<Awards> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = MySiteLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;

    Widget _alignment(Widget child) {
      return isLargeDisplay(context)
          ? Center(child: child)
          : Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
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

    Widget _items(CrossAxisAlignment alignment, List<Widget> children) {
      return _constraint(
        Column(
          crossAxisAlignment: alignment,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      );
    }

    Widget _dateText(String text) {
      return Text(
        text,
        textAlign: TextAlign.end,
        style: theme.textTheme.bodyText1,
        textScaleFactor: 1.5,
      );
    }

    Widget _descriptionText(String text) {
      return Text(
        text,
        style: theme.textTheme.subtitle1,
      );
    }

    List<TextSpan> _bestApp() {
      final bestAppLink = localizations.bestAppLink;
      final bestAppDescription = localizations.bestAppDescription(bestAppLink);
      final bestAppDescriptionIndex = bestAppDescription.indexOf(bestAppLink);
      final bestAppDescriptionIndexEnd =
          bestAppDescriptionIndex + bestAppLink.length;
      final bestAppDescriptionFirst =
          bestAppDescription.substring(0, bestAppDescriptionIndex);
      final bestAppDescriptionSecond =
          bestAppDescription.substring(bestAppDescriptionIndexEnd);
      return [
        TextSpan(
          style: theme.textTheme.subtitle1,
          text: bestAppDescriptionFirst,
        ),
        TextSpan(
          style: theme.textTheme.subtitle1!.copyWith(
            color: theme.primaryColor,
          ),
          text: bestAppLink,
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              if (await canLaunch(iwmfWebsite)) {
                await launch(iwmfWebsite);
              }
            },
        ),
        TextSpan(
          style: theme.textTheme.subtitle1,
          text: bestAppDescriptionSecond,
        ),
      ];
    }

    List<TextSpan> _mostDownloadApp() {
      final mostDownloadAppLink = localizations.mostDownloadAppLink;
      final mostDownloadAppDescription =
          localizations.mostDownloadAppDescription(mostDownloadAppLink);
      final mostDownloadDescriptionIndex =
          mostDownloadAppDescription.indexOf(mostDownloadAppLink);
      final mostDownloadDescriptionIndexEnd =
          mostDownloadDescriptionIndex + mostDownloadAppLink.length;
      final mostDownloadDescriptionFirst =
          mostDownloadAppDescription.substring(0, mostDownloadDescriptionIndex);
      final mostDownloadDescriptionSecond =
          mostDownloadAppDescription.substring(mostDownloadDescriptionIndexEnd);
      return [
        TextSpan(
          style: theme.textTheme.subtitle1,
          text: mostDownloadDescriptionFirst,
        ),
        TextSpan(
          style: theme.textTheme.subtitle1!.copyWith(
            color: theme.primaryColor,
          ),
          text: mostDownloadAppLink,
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              if (await canLaunch(applicationUrl)) {
                await launch(applicationUrl);
              }
            },
        ),
        TextSpan(
          style: theme.textTheme.subtitle1,
          text: mostDownloadDescriptionSecond,
        ),
      ];
    }

    return _alignment(
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: _items(
              CrossAxisAlignment.end,
              [
                _dateText(localizations.bestAppDate),
                _dateText(localizations.mostDownloadAppDate),
                _dateText(localizations.examDate),
                _dateText(localizations.olympiadDate),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          _constraint(
            RotatedBox(
              quarterTurns: 1,
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 0.1,
                  activeTickMarkColor: theme.primaryColor,
                  tickMarkShape:
                      const RoundSliderTickMarkShape(tickMarkRadius: 3.0),
                  thumbShape:
                      const RoundSliderThumbShape(disabledThumbRadius: 0),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                  disabledActiveTickMarkColor: Colors.grey,
                ),
                child: const Slider.adaptive(
                  value: 1,
                  divisions: 3,
                  onChanged: null,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            flex: 5,
            child: _items(
              CrossAxisAlignment.start,
              [
                Text.rich(TextSpan(children: _bestApp())),
                Divider(color: theme.primaryColor),
                Text.rich(TextSpan(children: _mostDownloadApp())),
                Divider(color: theme.primaryColor),
                _descriptionText(localizations.examDescription),
                Divider(color: theme.primaryColor),
                _descriptionText(localizations.olympiadDescription),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
