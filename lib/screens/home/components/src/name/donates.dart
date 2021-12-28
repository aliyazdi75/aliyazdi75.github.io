import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/my_site_localizations.dart';
import 'package:my_site/core/constants/index.dart';
import 'package:my_site/data/icons.dart';
import 'package:url_launcher/url_launcher.dart';

class _DonateItem {
  const _DonateItem({
    this.shouldCopy = false,
    required this.icon,
    required this.url,
  });

  final bool shouldCopy;
  final IconData icon;
  final String url;
}

class Donates extends StatelessWidget {
  Donates({Key? key}) : super(key: key);

  final List<_DonateItem> donateItems = <_DonateItem>[
    const _DonateItem(icon: MySiteIcons.money, url: idpayUrl),
    const _DonateItem(icon: MySiteIcons.paypal, url: paypalUrl),
    const _DonateItem(icon: MySiteIcons.binance, url: binanceUrl),
    const _DonateItem(
        shouldCopy: true, icon: MySiteIcons.bitcoin, url: bitcoinAddress),
    const _DonateItem(
        shouldCopy: true, icon: MySiteIcons.tether, url: tetherAddress),
    const _DonateItem(
        shouldCopy: true, icon: MySiteIcons.ethereum, url: ethereumAddress),
  ];

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.none),
        color: Theme.of(context).splashColor.withOpacity(0.03),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5.0,
        runSpacing: 5.0,
        children: List.generate(donateItems.length, (index) {
          return OutlinedButton(
            onPressed: () async => _onPressed(
                context, donateItems[index].shouldCopy, donateItems[index].url),
            child: Icon(donateItems[index].icon),
          );
        }),
      ),
    );
  }

  Future<void> _onPressed(
      BuildContext context, bool shouldCopy, String url) async {
    if (!shouldCopy && await canLaunch(url)) {
      await launch(url);
    } else if (shouldCopy) {
      Clipboard.setData(ClipboardData(text: url));
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(MySiteLocalizations.of(context)!.addressCopied),
          ),
        );
    }
  }
}
