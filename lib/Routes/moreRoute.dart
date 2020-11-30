import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project_new_style/Components/moreGridElement.dart';
import 'package:project_new_style/Enums/moreOptionsEnum.dart';
import 'package:project_new_style/Functions/moreFunctions.dart';

class MoreRoute extends StatefulWidget {
  final MoreOption _moreOption;

  MoreRoute(this._moreOption);

  @override
  _MoreRouteState createState() => _MoreRouteState(_moreOption);
}

class _MoreRouteState extends State<MoreRoute> {
  final MoreOption _moreOption;

  _MoreRouteState(this._moreOption);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
    bool _mobileView = _width < 800 ? true : false;

    return GridView.count(
      padding: EdgeInsets.fromLTRB(
          _mobileView ? _width / 7 : _width / 6,
          _mobileView ? 10 : 100,
          _mobileView ? _width / 7 : _width / 6,
          _mobileView ? 10 : 100),
      crossAxisCount: _mobileView ? 2 : 4,
      crossAxisSpacing: _mobileView ? 30.0 : _width / 30,
      mainAxisSpacing: _mobileView ? 10.0 : _width / 30,
      shrinkWrap: true,
      children: [
        GridElement(MoreOption.aboutUs),
        GridElement(MoreOption.contactUs),
        GridElement(MoreOption.pricings),
        GridElement(MoreOption.rules),
        GridElement(MoreOption.faq),
        GridElement(MoreOption.manual),
        GridElement(MoreOption.blog),
        GridElement(MoreOption.softWareTeam),
      ],
    );
  }
}

//TODO: set back button on pages with navigator.pop() similar to about us page
//TODO: in mobileView alignment of persian texts of grids is NOT correct
