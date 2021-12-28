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
    required this.name,
    required this.url,
  });

  final bool shouldCopy;
  final IconData icon;
  final String name;
  final String url;
}

class Donates extends StatelessWidget {
  const Donates({Key? key}) : super(key: key);

  List<_DonateItem> donateItems(BuildContext context) => <_DonateItem>[
        _DonateItem(
          name: MySiteLocalizations.of(context)!.idPay,
          icon: MySiteIcons.money,
          url: idpayUrl,
        ),
        _DonateItem(
          name: MySiteLocalizations.of(context)!.paypal,
          icon: MySiteIcons.paypal,
          url: paypalUrl,
        ),
        _DonateItem(
          name: MySiteLocalizations.of(context)!.binance,
          icon: MySiteIcons.binance,
          url: binanceUrl,
        ),
        _DonateItem(
          name: MySiteLocalizations.of(context)!.bitcoin,
          shouldCopy: true,
          icon: MySiteIcons.bitcoin,
          url: bitcoinAddress,
        ),
        _DonateItem(
          name: MySiteLocalizations.of(context)!.tether,
          shouldCopy: true,
          icon: MySiteIcons.tether,
          url: tetherAddress,
        ),
        _DonateItem(
          name: MySiteLocalizations.of(context)!.ethereum,
          shouldCopy: true,
          icon: MySiteIcons.ethereum,
          url: ethereumAddress,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final theme = Theme.of(context);
    final items = donateItems(context);

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
        children: List.generate(items.length, (index) {
          return Tooltip(
            message: items[index].name,
            child: OutlinedButton(
              onPressed: () async => _onPressed(
                context,
                items[index].shouldCopy,
                items[index].name,
                items[index].url,
              ),
              child: Icon(items[index].icon),
            ),
          );
        }),
      ),
    );
  }

  Future<void> _onPressed(
    BuildContext context,
    bool shouldCopy,
    String name,
    String url,
  ) async {
    if (!shouldCopy && await canLaunch(url)) {
      await launch(url);
    } else if (shouldCopy) {
      Clipboard.setData(ClipboardData(text: url));
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
                name + ' ' + MySiteLocalizations.of(context)!.addressCopied),
          ),
        );
    }
  }
}
