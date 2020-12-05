import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';

class Manual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return Container(
      color: backgroundColor,
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: appBarHeight + pagesTopMargin,
            left: pagesRightAndLeftMargin(_width, _mobileView),
            right: pagesRightAndLeftMargin(_width, _mobileView),
          ),
          child: Column(
            children: [
              Text('manual'),
            ],
          ),
        ),
        NormalAppBar(manualPageTitle, true),
      ]),
    );
  }
}
