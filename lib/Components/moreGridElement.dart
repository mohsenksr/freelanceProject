import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project_new_style/Enums/moreRouteEnum.dart';
import 'package:project_new_style/Pages/More/aboutUs.dart';
import 'package:project_new_style/Pages/More/blog.dart';
import 'package:project_new_style/Pages/More/contactUs.dart';
import 'package:project_new_style/Pages/More/faq.dart';
import 'package:project_new_style/Pages/More/manual.dart';
import 'package:project_new_style/Pages/More/pricings.dart';
import 'package:project_new_style/Pages/More/rules.dart';
import 'package:project_new_style/Pages/More/softwareTeam.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/textStyles.dart';

class GridElement extends StatelessWidget {
  final MoreTabPage _moreTabPage;

  GridElement(this._moreTabPage);

  IconData getIcon() {
    switch (_moreTabPage) {
      case MoreTabPage.aboutUs:
        return Icons.info;
        break;
      case MoreTabPage.contactUs:
        return Icons.contact_phone;
        break;
      case MoreTabPage.faq:
        return Icons.my_library_books;
        break;
      case MoreTabPage.rules:
        return Icons.rule;
        break;
      case MoreTabPage.pricings:
        return Icons.attach_money;
        break;
      case MoreTabPage.manual:
        return Icons.integration_instructions;
        break;
      case MoreTabPage.blog:
        return Icons.web;
        break;
      case MoreTabPage.softWareTeam:
        return Icons.developer_mode;
        break;
      default:
        return Icons.info;
    }
  }

  String getText() {
    switch (_moreTabPage) {
      case MoreTabPage.aboutUs:
        return 'درباره ما';
        break;
      case MoreTabPage.contactUs:
        return 'تماس با ما';
        break;
      case MoreTabPage.faq:
        return 'سؤالات متداول';
        break;
      case MoreTabPage.rules:
        return 'قوانین و مقررات';
        break;
      case MoreTabPage.pricings:
        return 'تعرفه‌ها';
        break;
      case MoreTabPage.manual:
        return 'راهنمای سایت';
        break;
      case MoreTabPage.blog:
        return 'وبلاگ';
        break;
      case MoreTabPage.softWareTeam:
        return 'تیم توسعه';
        break;
      default:
        return 'درباره ما';
    }
  }

  //important comment: if any more page changes to stateful, switch case below must change.

  StatelessWidget getScreen() {
    switch (_moreTabPage) {
      case MoreTabPage.aboutUs:
        return AboutUs();
        break;
      case MoreTabPage.contactUs:
        return ContactUs();
        break;
      case MoreTabPage.faq:
        return Faq();
        break;
      case MoreTabPage.rules:
        return Rules();
        break;
      case MoreTabPage.pricings:
        return Pricings();
        break;
      case MoreTabPage.manual:
        return Manual();
        break;
      case MoreTabPage.blog:
        return Blog();
        break;
      case MoreTabPage.softWareTeam:
        return SoftwareTeam();
        break;
      default:
        return AboutUs();
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < 800 ? true : false;

    return InkWell(
      // borderRadius: BorderRadius.circular(30),

      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 5),
          borderRadius: BorderRadius.circular(20),
        ),
        color: themeColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: Icon(
                getIcon(),
                size: _mobileView ? _width / 10 : _width / 25,
                color: Colors.white,
              ),
            ),
            Flexible(
                flex: 1,
                child: Text(
                  getText(),
                  style: TextStyle(
                      color: Colors.white, fontFamily: mainFontFamily),
                )),
          ],
        ),
      ),
      onTap: () {
        pushNewScreenWithRouteSettings(
          context,
          settings: RouteSettings(name: '/home'),
          screen: getScreen(),

          // pageTransitionAnimation: PageTransitionAnimation.scaleRotate
        );
      },
    );
  }
}
