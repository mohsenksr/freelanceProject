import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import './../Styles/colors.dart';
import './../Styles/textStyles.dart';

class ProfileRoute extends StatefulWidget {
  @override
  _ProfileRouteState createState() => _ProfileRouteState();
}

class _ProfileRouteState extends State<ProfileRoute> {
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
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: appBarHeight + pagesTopMargin,
            ),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: pagesBottomMargin,
                  left: pagesRightAndLeftMargin(_width, _mobileView),
                  right: pagesRightAndLeftMargin(_width, _mobileView),
                ),
                child: Column(
                  children: [
                    Text(
                      'profile state: ' + _state.toString(),
                      style: normalText,
                    ),
                    RaisedButton(
                      child: Text(
                        'change state',
                        style: normalText,
                      ),
                      onPressed: () => changeState(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          NormalAppBar(profilePageTitle, false),
        ],
      ),
    );
  }
}
