import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Pages/customErrorWidget.dart';
import 'package:project_new_style/Components/customIndicator.dart';
import 'package:project_new_style/Components/MoreRoute/pricingsWidget.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/providers/MorePageProviders/pricingProvider.dart';
import 'package:provider/provider.dart';

class Pricings extends StatelessWidget {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(pricingsPageTitle),
        centerTitle: true,
        textTheme: theme.textTheme,
      ),
      backgroundColor: theme.backgroundColor,
      body: FutureBuilder(
        future: Provider.of<PricingProvider>(context, listen: false)
            .fetchPricings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return CustomIndicator();
          if (snapshot.hasError) return CustomErrorWidget();
          return Scrollbar(
            controller: _scrollController,
            isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                margin: EdgeInsets.only(
                  top: pagesTopMargin,
                  bottom: pagesBottomMargin,
                  left: pagesRightAndLeftMargin(_width, _mobileView),
                  right: pagesRightAndLeftMargin(_width, _mobileView),
                ),
                child: Consumer<PricingProvider>(
                  builder: (context, data, child) => Column(
                    children: [
                      ...data.pricings
                          .map(
                            (e) => Directionality(
                              textDirection: TextDirection.rtl,
                              child: PricingsWidget(
                                pricingModel: e,
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
