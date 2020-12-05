import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/moreGridElement.dart';
import 'package:project_new_style/Enums/moreOptionsEnum.dart';
import 'package:project_new_style/Functions/moreFunctions.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';

class MoreRoute extends StatefulWidget {
  final MoreOption _moreOption;
  final int _id;

  MoreRoute(this._moreOption, this._id);

  @override
  _MoreRouteState createState() => _MoreRouteState(_moreOption, _id);
}

class _MoreRouteState extends State<MoreRoute> {
  final MoreOption _moreOption;
  final int _id;

  _MoreRouteState(this._moreOption, this._id);

  @override
  void initState() {
    super.initState();
    print(_id);

    if (_moreOption != null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => pushNewScreenWithRouteSettings(
                context,
                settings: null,
                screen: getScreen(_moreOption),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          GridView.count(
            padding: EdgeInsets.fromLTRB(
                _mobileView ? _width / 7 : _width / 6,
                _mobileView ? appBarHeight + pagesTopMargin : 180,
                _mobileView ? _width / 7 : _width / 6,
                _mobileView ? 30 : 100),
            crossAxisCount: _mobileView ? 2 : 4,
            crossAxisSpacing: _mobileView ? 30.0 : _width / 30,
            mainAxisSpacing: _mobileView ? 10.0 : _width / 30,
            shrinkWrap: true,
            children: [
              ...(MoreOption.values as List<MoreOption>).map((option) {
                return GridElement(option);
              }).toList(),
            ],
          ),
          NormalAppBar(morePageTitle, false),
        ],
      ),
    );
  }
}
