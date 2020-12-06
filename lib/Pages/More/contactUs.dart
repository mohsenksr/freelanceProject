import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/customErrorWidget.dart';
import 'package:project_new_style/Components/customIndicator.dart';
import 'package:project_new_style/Components/moreTextElement.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/icons.dart';
import 'package:project_new_style/providers/MorePageProviders/contactUsProvider.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return FutureBuilder(
        future: Provider.of<ContactUsProvider>(context, listen: false)
            .fetchContactUs(),
        builder: (ctx, snapShot) {
          print(snapShot.connectionState);
          if (snapShot.connectionState == ConnectionState.waiting) {
            return CustomIndicator();
          } else {
            if (snapShot.hasError) {
              print('no data');
              return CustomErrorWidget();
            } else {
              return Container(
                color: backgroundColor,
                child: Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: appBarHeight + pagesTopMargin,
                    ),
                    child: SingleChildScrollView(
                      child: Consumer<ContactUsProvider>(
                        builder: (ctx, data, child) => Container(
                          margin: EdgeInsets.only(
                            bottom: pagesBottomMargin,
                            left: pagesRightAndLeftMargin(_width, _mobileView),
                            right: pagesRightAndLeftMargin(_width, _mobileView),
                          ),
                          child: Column(
                            children: [
                              ...(data.contactUs as List<Map<String, Object>>)
                                  .map((item) {
                                return Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: MoreTextElement(
                                      item,
                                      'question',
                                      'answer',
                                      contactUsIcon,
                                    ));
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  NormalAppBar(contactUsPageTitle, true),
                ]),
              );
            }
          }
        });
  }
}
