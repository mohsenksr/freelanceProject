import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/homeWebDesktopAppBar.dart';
import 'package:project_new_style/AppBars/homeWebMobileAppBar.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/HomeRoute/ProjectAndServiceSuggest.dart';
import 'package:project_new_style/Components/HomeRoute/homeListHeader.dart';
import 'package:project_new_style/Components/HomeRoute/webDesktopHomeFooter.dart';
import 'package:project_new_style/Components/HomeRoute/webDesktopHomeImageAndText.dart';
import 'package:project_new_style/Components/HomeRoute/webMobileHomeFooter.dart';
import 'package:project_new_style/Components/HomeRoute/webMobileHomeImageAndText.dart';
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
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: appBarHeight,
            ),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: pagesTopMargin,
                  bottom: pagesBottomMargin,
                  left: homePageRightAndLeftMargin(_width, _mobileView),
                  right: homePageRightAndLeftMargin(_width, _mobileView),
                ),
                child: Column(
                  children: [
                    kIsWeb
                        ? _mobileView
                            ? WebMobileHomeImageAndText(
                                homeFirstStringTitle,
                                homeFirstStringDescription,
                                'assets/homeOne.png',
                              )
                            : WebDesktopHomeImageAndText(
                                homeFirstStringTitle,
                                homeFirstStringDescription,
                                'assets/homeOne.png',
                              )
                        : SizedBox.shrink(),
                    kIsWeb
                        ? _mobileView
                            ? WebMobileHomeImageAndText(
                                homeSecondStringTitle,
                                homeSecondStringDescription,
                                'assets/homeTwo.png',
                              )
                            : WebDesktopHomeImageAndText(
                                homeSecondStringTitle,
                                homeSecondStringDescription,
                                'assets/homeTwo.png',
                              )
                        : SizedBox.shrink(),
                    HomeListHeader(
                      'پروژه‌ها',
                      () => {
                        //TODO
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 135,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) =>
                            ProjectAndServiceSuggest(
                          'http://138.201.6.240:8001/media/blog_photos/increase-virgool.jpg',
                          30000,
                          'نمونه پروژه',
                        ),
                      ),
                    ),
                    HomeListHeader(
                      'سرویس‌ها',
                      () => {
                        //TODO
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 135,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) =>
                            ProjectAndServiceSuggest(
                          'http://138.201.6.240:8001/media/blog_photos/omid4.jpg',
                          10000,
                          'نمونه سرویس',
                        ),
                      ),
                    ),
                    kIsWeb
                        ? Divider(
                            height: 100,
                            thickness: 3,
                          )
                        : SizedBox.shrink(),
                    Card(
                      child: kIsWeb
                          ? _mobileView
                              ? WebMobileHomeFooter()
                              : WebDesktopHomeFooter()
                          : SizedBox.shrink(),
                    )
                  ],
                ),
              ),
            ),
          ),
          kIsWeb
              ? _mobileView
                  ? HomeWebMobileAppBar()
                  : HomeWebDesktopAppBar()
              : NormalAppBar(homePageAppBarTitle, false),
        ],
      ),
    );
  }
}
