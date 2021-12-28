import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_site/layout/adaptive.dart';

import 'components/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final contentPadding = shortestSide * 0.05;

    final adaptiveBody = Center(
      child: SingleChildScrollView(
        child: SafeArea(
          child: AnimatedPadding(
              duration: const Duration(milliseconds: 750),
              padding: isMediumDisplay(context)
                  ? EdgeInsets.fromLTRB(
                      contentPadding, contentPadding, contentPadding, 0)
                  : const EdgeInsets.all(0),
              child: const Name()
              // child: AdaptiveSize(
              //         large: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: <Widget>[
              //             const Name(),
              //             SizedBox(
              //               height: 200,
              //               child: DecoratedBox(
              //                 decoration: BoxDecoration(
              //                   border: Border(
              //                     left: BorderSide(
              //                         color: Theme.of(context).dividerColor),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             const Info(),
              //           ],
              //         ),
              //         medium: Column(
              //           children: const <Widget>[
              //             Name(),
              //             Info(),
              //           ],
              //         ),
              //         small: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: const <Widget>[
              //             Avatar(),
              //           ],
              //         ),
              //       ),
              ),
        ),
      ),
    );

    return AdaptiveDesign(
      material: Scaffold(
        body: adaptiveBody,
        resizeToAvoidBottomInset: true,
        // floatingActionButton: isMediumDisplay(context) ? const Menu() : null,
        // bottomNavigationBar: isLargeDisplay(context) ? const Menu() : null,
      ),
      cupertino: CupertinoPageScaffold(
        child: adaptiveBody,
      ),
    );
  }
}
