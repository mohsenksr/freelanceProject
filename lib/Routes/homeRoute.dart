import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/homeWebAppBar.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import './../Styles/colors.dart';
import './../Styles/textStyles.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  int _state = 0;

  changeState() {
    setState(() {
      if (_state == 0) {
        _state = 1;
      } else {
        _state = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: appBarHeight + pagesTopMargin),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'home state: ' + _state.toString(),
                  style: normalText,
                ),
                RaisedButton(
                  child: Text(
                    'change state',
                    style: normalText,
                  ),
                  onPressed: () => changeState(),
                  color: themeColor,
                ),
              ],
            ),
          ),
          kIsWeb ? HomeWebAppBar() : NormalAppBar(homePageAppBarTitle, false),
        ],
      ),
    );
  }
}
