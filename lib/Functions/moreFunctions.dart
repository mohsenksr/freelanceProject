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

IconData getIcon(moreOption) {
  switch (moreOption) {
    case MoreOption.aboutUs:
      return Icons.info;
      break;
    case MoreOption.contactUs:
      return Icons.contact_phone;
      break;
    case MoreOption.faq:
      return Icons.my_library_books;
      break;
    case MoreOption.rules:
      return Icons.rule;
      break;
    case MoreOption.pricings:
      return Icons.attach_money;
      break;
    case MoreOption.manual:
      return Icons.integration_instructions;
      break;
    case MoreOption.blog:
      return Icons.web;
      break;
    case MoreOption.softWareTeam:
      return Icons.developer_mode;
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
