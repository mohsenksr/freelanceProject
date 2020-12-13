import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project_new_style/Enums/moreOptionsEnum.dart';
import 'package:project_new_style/Functions/moreFunctions.dart';
import 'package:project_new_style/Setting/numbers.dart';

import 'package:project_new_style/Styles/textStyles.dart';

class GridElement extends StatelessWidget {
  final MoreOption _moreOption;
  final int blogPostId;

  GridElement(this._moreOption, {this.blogPostId});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: Icon(
                getIcon(_moreOption),
                size: _mobileView ? _width / 10 : _width / 25,
                color: Colors.white,
              ),
            ),
            Flexible(
                flex: 1,
                child: Text(
                  getText(_moreOption),
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.white, fontFamily: mainFontFamily),
                )),
          ],
        ),
      ),
      onTap: () {
        pushNewScreenWithRouteSettings(
          context,
          settings: null,
          screen: blogPostId == null
              ? getScreen(
                  _moreOption,
                )
              : getScreen(
                  _moreOption,
                  blogPostId: blogPostId,
                ),
          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      },
    );
  }
}
