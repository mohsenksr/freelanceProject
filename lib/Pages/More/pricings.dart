import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/customErrorWidget.dart';
import 'package:project_new_style/Components/customIndicator.dart';
import 'package:project_new_style/Components/pricingsWidget.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/providers/MorePageProviders/pricingProvider.dart';
import 'package:provider/provider.dart';

class Pricings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return FutureBuilder(
      future:
          Provider.of<PricingProvider>(context, listen: false).fetchPricings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return CustomIndicator();
        if (snapshot.hasError) return CustomErrorWidget();
        return Consumer<PricingProvider>(
          builder: (context, data, child) => Container(
            color: Theme.of(context).backgroundColor,
            child: Stack(children: [
              Container(
                // alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: appBarHeight,
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: pagesTopMargin,
                      bottom: pagesBottomMargin,
                      left: pagesRightAndLeftMargin(_width, _mobileView),
                      right: pagesRightAndLeftMargin(_width, _mobileView),
                    ),
                    child: Column(
                      children: [
                        ...data.pricings
                            .map(
                              (e) => PricingsWidget(
                                pricingModel: e,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
              NormalAppBar(pricingsPageTitle, true),
            ]),
          ),
        );
      },
    );
  }
}
