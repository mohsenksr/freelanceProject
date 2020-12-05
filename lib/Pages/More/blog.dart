import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/blogPost.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';

class Blog extends StatelessWidget {
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
            left: pagesRightAndLeftMargin(_width, _mobileView),
            right: pagesRightAndLeftMargin(_width, _mobileView),
          ),
          child: Column(
            children: [
              BlogPost(
                  'سلام چطوری؟ اگه من توی تیتر انگلیسی یا همون english به کار ببرم، مشکلی نداره؟ توی وب چطوره؟',
                  'http://138.201.6.240:8001/media/blog_photos/chess.jpg',
                  '۱۳۹۹/۴/۱۴'),
            ],
          ),
        ),
        NormalAppBar(blogPageTitle, true),
      ]),
    );
  }
}
