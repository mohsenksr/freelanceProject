import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';

class SoftwareTeam extends StatelessWidget {
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
              Text('software team'),
            ],
          ),
        ),
        NormalAppBar(softwareTeamPageTitle, true),
      ]),
    );
  }
}
