import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';

//....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!
//this is just a template for creating new pages
//we never use this class in our code
//....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!....!!!!

class ScreenTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: appBarHeight + pagesTopMargin),
          child: Column(
            children: [
              Text('this is just a template for creating new pages.'),
              Text('never use this class!'),
              Text(
                  'for create new pages, don\'t rermove Container/Stack/Container classes.'),
              Text('these are necessary for appbar'),
              Text('also don\'t edit color and margin'),
              Text(
                  'don\'t forget to add page title in strings and edit NormalAppBar arguments'),
            ],
          ),
        ),
        NormalAppBar(templatePageTitle, true),
      ]),
    );
  }
}
