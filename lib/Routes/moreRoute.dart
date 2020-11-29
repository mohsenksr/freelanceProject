import 'package:flutter/material.dart';
import 'package:project_new_style/Components/moreGridElement.dart';
import 'package:project_new_style/Enums/moreRouteEnum.dart';

class MoreRoute extends StatefulWidget {
  @override
  _MoreRouteState createState() => _MoreRouteState();
}

class _MoreRouteState extends State<MoreRoute> {
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
        GridElement(MoreTabPage.aboutUs),
        GridElement(MoreTabPage.contactUs),
        GridElement(MoreTabPage.pricings),
        GridElement(MoreTabPage.rules),
        GridElement(MoreTabPage.faq),
        GridElement(MoreTabPage.manual),
        GridElement(MoreTabPage.blog),
        GridElement(MoreTabPage.softWareTeam),
      ],
    );
  }
}

//TODO: set back button on pages with navigator.pop() similar to about us page
//TODO: in mobileView alignment of persian texts of grids is NOT correct
