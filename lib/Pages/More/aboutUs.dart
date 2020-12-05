import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/customErrorWidget.dart';
import 'package:project_new_style/Components/customIndicator.dart';
import 'package:project_new_style/Components/moreTextElement.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/icons.dart';
import 'package:project_new_style/providers/MorePageProviders/aboutUsProvider.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return FutureBuilder(
        future:
            Provider.of<AboutUsProvider>(context, listen: false).fetchAboutUs(),
        builder: (ctx, snapShot) {
          //print(snapShot.connectionState);
          if (snapShot.connectionState == ConnectionState.waiting) {
            return CustomIndicator();
          } else {
            //print(snapShot.hasError);
            if (snapShot.hasError) {
              //print('no data');
              return CustomErrorWidget();
            } else {
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
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: pagesBottomMargin,
                        ),
                        child:
                            Consumer<AboutUsProvider>(builder: (ctx, d, child) {
                          //print(d.aboutUs[0]['id']);
                          return Column(
                            children: [
                              ...(d.aboutUs as List<Map<String, Object>>)
                                  .map((item) {
                                return Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: MoreTextElement(
                                      item,
                                      'question',
                                      'answer',
                                      aboutUsIcon,
                                    ));
                              }).toList(),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  NormalAppBar(aboutUsPageTitle, true),
                ]),
              );
            }
          }
        });
  }
}
