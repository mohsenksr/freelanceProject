import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/manualWidget.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:provider/provider.dart';

import '../../Components/customErrorWidget.dart';
import '../../Components/customIndicator.dart';
import '../../providers/MorePageProviders/manualProvider.dart';

class Manual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return FutureBuilder(
        future:
            Provider.of<ManualProvider>(context, listen: false).fetchManual(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CustomIndicator();
          }
          if (snapshot.hasError) {
            return CustomErrorWidget();
          }
          return Consumer<ManualProvider>(
            builder: (context, data, child) => Container(
              color: Theme.of(context).backgroundColor,
              child: Stack(children: [
                Container(
                  // alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: appBarHeight + pagesTopMargin,
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: pagesBottomMargin,
                        left: pagesRightAndLeftMargin(_width, _mobileView),
                        right: pagesRightAndLeftMargin(_width, _mobileView),
                      ),
                      child: Column(
                        children: [
                          ...data.manuals.map((e) => ManualWidget(
                                manualModel: e,
                              ))
                        ].toList(),
                      ),
                    ),
                  ),
                ),
                NormalAppBar(manualPageTitle, true),
              ]),
            ),
          );
        });
  }
}
