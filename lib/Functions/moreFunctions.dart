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

StatelessWidget getScreen(moreOption) {
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
      return Blog();
      break;
    case MoreOption.softWareTeam:
      return SoftwareTeam();
      break;
    default:
      return AboutUs();
  }
}
