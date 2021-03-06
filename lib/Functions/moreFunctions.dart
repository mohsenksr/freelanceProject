import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_new_style/Enums/moreOptionsEnum.dart';
import 'package:project_new_style/Pages/More/aboutUs.dart';
import 'package:project_new_style/Pages/More/blog.dart';
import 'package:project_new_style/Pages/More/contactUs.dart';
import 'package:project_new_style/Pages/More/faq.dart';
import 'package:project_new_style/Pages/More/manual.dart';
import 'package:project_new_style/Pages/More/pricings.dart';
import 'package:project_new_style/Pages/More/rules.dart';
import 'package:project_new_style/Pages/More/softwareTeam.dart';
import 'package:project_new_style/Styles/icons.dart';

IconData getIcon(moreOption) {
  switch (moreOption) {
    case MoreOption.aboutUs:
      return aboutUsIcon;
      break;
    case MoreOption.contactUs:
      return contactUsIcon;
      break;
    case MoreOption.faq:
      return faqIcon;
      break;
    case MoreOption.rules:
      return rulesIcon;
      break;
    case MoreOption.pricings:
      return pricingsIcon;
      break;
    case MoreOption.manual:
      return manualIcon;
      break;
    case MoreOption.blog:
      return blogIcon;
      break;
    case MoreOption.softWareTeam:
      return softWareTeamIcon;
      break;
    default:
      return Icons.info;
  }
}

//TODO: remove hard code
String getText(moreOption) {
  switch (moreOption) {
    case MoreOption.aboutUs:
      return 'درباره ما';
      break;
    case MoreOption.contactUs:
      return 'تماس با ما';
      break;
    case MoreOption.faq:
      return 'سؤالات متداول';
      break;
    case MoreOption.rules:
      return 'قوانین و مقررات';
      break;
    case MoreOption.pricings:
      return 'تعرفه‌ها';
      break;
    case MoreOption.manual:
      return 'راهنمای سایت';
      break;
    case MoreOption.blog:
      return 'وبلاگ';
      break;
    case MoreOption.softWareTeam:
      return 'تیم توسعه';
      break;
    default:
      return 'درباره ما';
  }
}

//important comment: if any more page changes to stateful, switch case below must change.

Widget getScreen(moreOption, {blogPostId}) {
  switch (moreOption) {
    case MoreOption.aboutUs:
      return AboutUs();
      break;
    case MoreOption.contactUs:
      return ContactUs();
      break;
    case MoreOption.faq:
      return Faq();
      break;
    case MoreOption.rules:
      return Rules();
      break;
    case MoreOption.pricings:
      return Pricings();
      break;
    case MoreOption.manual:
      return Manual();
      break;
    case MoreOption.blog:
      return Blog(0);
      break;
    case MoreOption.softWareTeam:
      return SoftwareTeam();
      break;
    default:
      return AboutUs();
  }
}

String getBlogPostDate(String dateTime) {
  //  "1399-09-10T07:43:39.022775+00:00"
  String englishDate = dateTime.split('-')[0] +
      '/' +
      dateTime.split('-')[1] +
      '/' +
      dateTime.split('-')[2].substring(0, 2);

  return getPersianNumbers(englishDate);
}

String getBlogPostTime(String dateTime) {
  String englishTime = dateTime.split('T')[1].substring(0, 5);
  return getPersianNumbers(englishTime);
}

String getPersianNumbers(String englishNumbers) {
  return englishNumbers
      .replaceAll('0', '۰')
      .replaceAll('1', '۱')
      .replaceAll('2', '۲')
      .replaceAll('3', '۳')
      .replaceAll('4', '۴')
      .replaceAll('5', '۵')
      .replaceAll('6', '۶')
      .replaceAll('7', '۷')
      .replaceAll('8', '۸')
      .replaceAll('9', '۹');
}
