import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/blogPostElement.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/textStyles.dart';

class Blog extends StatelessWidget {
  final int postId;
  final int _pageIndex;

  Blog(this._pageIndex, {this.postId});

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
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                bottom: pagesBottomMargin,
                left: pagesRightAndLeftMargin(_width, _mobileView),
                right: pagesRightAndLeftMargin(_width, _mobileView),
              ),
              child: Column(
                children: [
                  BlogPostElement(
                      'سلام چطوری؟ اگه من توی تیتر انگلیسی یا همون english به کار ببرم، مشکلی نداره؟ توی وب چطوره؟',
                      'https://cdn.mashreghnews.ir/d/2017/04/09/2/1901522.jpg',
                      '۱۳۹۹/۴/۱۴',
                      '۲۳:۱۴'),
                  BlogPostElement(
                      'سلام چطوری؟ اگه من توی تیتر انگلیسی یا همون english به کار ببرم، مشکلی نداره؟ توی وب چطوره؟',
                      'https://cdn.mashreghnews.ir/d/2017/04/09/2/1901522.jpg',
                      '۱۳۹۹/۴/۱۴',
                      '۲۳:۱۴'),
                  BlogPostElement(
                      'سلام چطوری؟ اگه من توی تیتر انگلیسی یا همون english به کار ببرم، مشکلی نداره؟ توی وب چطوره؟',
                      'https://cdn.mashreghnews.ir/d/2017/04/09/2/1901522.jpg',
                      '۱۳۹۹/۴/۱۴',
                      '۲۳:۱۴'),
                  BlogPostElement(
                      'سلام چطوری؟ اگه من توی تیتر انگلیسی یا همون english به کار ببرم، مشکلی نداره؟ توی وب چطوره؟',
                      'https://cdn.mashreghnews.ir/d/2017/04/09/2/1901522.jpg',
                      '۱۳۹۹/۴/۱۴',
                      '۲۳:۱۴'),
                  BlogPostElement(
                      'سلام چطوری؟ اگه من توی تیتر انگلیسی یا همون english به کار ببرم، مشکلی نداره؟ توی وب چطوره؟',
                      'https://cdn.mashreghnews.ir/d/2017/04/09/2/1901522.jpg',
                      '۱۳۹۹/۴/۱۴',
                      '۲۳:۱۴'),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: themeColor,
                            child: Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  'صفحه بعدی',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontFamily: mainFontFamily,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          onTap: () => {},
                        ),
                        Text(
                          'صفحه ' + (_pageIndex + 1).toString(),
                          style: TextStyle(
                            fontFamily: mainFontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: _pageIndex == 0 ? Colors.grey : themeColor,
                            child: Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  'صفحه قبلی',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontFamily: mainFontFamily,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          onTap: () => {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        NormalAppBar(blogPageTitle, true),
      ]),
    );
  }
}
