import 'package:flutter/widgets.dart';
import 'package:project_new_style/Enums/homeOptionsEnum.dart';
import 'package:project_new_style/Enums/mainTabsEnum.dart';
import 'package:project_new_style/Enums/moreOptionsEnum.dart';
import 'package:project_new_style/main.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/home': (context) => MainScreen(
        initialTab: MainTab.home,
      ),
  '/messages': (context) => MainScreen(
        initialTab: MainTab.messages,
      ),
  '/search': (context) => MainScreen(
        initialTab: MainTab.search,
      ),
  '/profile': (context) => MainScreen(
        initialTab: MainTab.profile,
      ),
  '/more': (context) => MainScreen(
        initialTab: MainTab.more,
      ),

  //home pages
  '/project': (context) => MainScreen(
        initialTab: MainTab.home,
        homeOption: HomeOption.project,
      ),
  '/user-profile': (context) => MainScreen(
        initialTab: MainTab.home,
        homeOption: HomeOption.userProfile,
      ),
  '/service': (context) => MainScreen(
        initialTab: MainTab.home,
        homeOption: HomeOption.service,
      ),

  //more pages
  '/about-us': (context) => MainScreen(
        initialTab: MainTab.more,
        moreOption: MoreOption.aboutUs,
      ),
  '/contact-us': (context) => MainScreen(
        initialTab: MainTab.more,
        moreOption: MoreOption.contactUs,
      ),
  '/pricings': (context) => MainScreen(
        initialTab: MainTab.more,
        moreOption: MoreOption.pricings,
      ),
  '/rules': (context) => MainScreen(
        initialTab: MainTab.more,
        moreOption: MoreOption.rules,
      ),
  '/faq': (context) => MainScreen(
        initialTab: MainTab.more,
        moreOption: MoreOption.faq,
      ),
  '/manual': (context) => MainScreen(
        initialTab: MainTab.more,
        moreOption: MoreOption.manual,
      ),
  '/blog': (context) => MainScreen(
        initialTab: MainTab.more,
        moreOption: MoreOption.blog,
      ),
  '/software-team': (context) => MainScreen(
        initialTab: MainTab.more,
        moreOption: MoreOption.softWareTeam,
      ),
};

int getInitialIndex(initialTab) {
  switch (initialTab) {
    case MainTab.home:
      return 0;
      break;
    case MainTab.messages:
      return 1;
      break;
    case MainTab.search:
      return 2;
      break;
    case MainTab.profile:
      return 3;
      break;
    case MainTab.more:
      return 4;
      break;
    default:
      return 0;
  }
}
