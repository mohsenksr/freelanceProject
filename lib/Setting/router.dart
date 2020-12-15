import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:project_new_style/Enums/mainTabsEnum.dart';
import 'package:project_new_style/Enums/moreOptionsEnum.dart';
import 'package:project_new_style/Routes/mainScreen.dart';

class FluroMainRouter {
  static var router = FluroRouter();

  static getMainTabHandler(MainTab mainTab) {
    return Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return MainScreen(
        initialTab: mainTab,
      );
    });
  }

  static getMoreOptionHandler(MoreOption moreOption) {
    return Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return MainScreen(
        initialTab: MainTab.more,
        moreOption: moreOption,
      );
    });
  }

  static var blogHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MainScreen(
      initialTab: MainTab.more,
      moreOption: MoreOption.blog,
      id: int.parse(params['id'][0]),
    );
  });

  static void defineRoutes() {
    //main tabs
    router.define('/home', handler: getMainTabHandler(MainTab.home));
    router.define('/messages', handler: getMainTabHandler(MainTab.messages));
    router.define('/search', handler: getMainTabHandler(MainTab.search));
    router.define('/profile', handler: getMainTabHandler(MainTab.profile));
    router.define('/more', handler: getMainTabHandler(MainTab.more));

    //more options

    router.define(
      '/about-us',
      handler: getMoreOptionHandler(MoreOption.aboutUs),
    );
    router.define(
      '/contact-us',
      handler: getMoreOptionHandler(MoreOption.contactUs),
    );
    router.define(
      '/pricings',
      handler: getMoreOptionHandler(MoreOption.pricings),
    );
    router.define(
      '/rules',
      handler: getMoreOptionHandler(MoreOption.rules),
    );
    router.define(
      '/faq',
      handler: getMoreOptionHandler(MoreOption.faq),
    );
    router.define(
      '/manual',
      handler: getMoreOptionHandler(MoreOption.manual),
    );
    router.define(
      '/blog',
      handler: getMoreOptionHandler(MoreOption.blog),
    );
    router.define(
      '/softwareTeam',
      handler: getMoreOptionHandler(MoreOption.softWareTeam),
    );

    //blog post
    router.define('/blog/:id', handler: blogHandler);

    // it is also possible to define the route transition to use
    // router.define('users/:id', handler: usersHandler, transitionType: TransitionType.inFromLeft);
  }
}
