import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project_new_style/Enums/homeOptionsEnum.dart';
import 'package:project_new_style/Enums/mainTabsEnum.dart';
import 'package:project_new_style/Enums/moreOptionsEnum.dart';
import 'package:project_new_style/Routes/homeRoute.dart';
import 'package:project_new_style/Routes/messagesRoute.dart';
import 'package:project_new_style/Routes/moreRoute.dart';
import 'package:project_new_style/Routes/profileRoute.dart';
import 'package:project_new_style/Routes/searchRoute.dart';
import 'package:project_new_style/Setting/router.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/icons.dart';
import 'package:project_new_style/Functions/mainFunctions.dart';
import 'package:project_new_style/providers/MorePageProviders/aboutUsProvider.dart';
import 'package:project_new_style/providers/MorePageProviders/blogProvider.dart';
import 'package:project_new_style/providers/MorePageProviders/contactUsProvider.dart';
import 'package:project_new_style/providers/MorePageProviders/faqProvider.dart';
import 'package:project_new_style/providers/MorePageProviders/manualProvider.dart';
import 'package:project_new_style/providers/MorePageProviders/pricingProvider.dart';
import 'package:project_new_style/providers/MorePageProviders/rulesProvider.dart';
import 'package:provider/provider.dart';
import 'Configures/configure_nonweb.dart'
    if (dart.library.html) 'Configures/configure_web.dart';

import 'Styles/textStyles.dart';

void main() {
  configureApp();
  FluroMainRouter.defineRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(
        initialTab: MainTab.home,
      ),
      initialRoute: '/',
      onGenerateRoute: FluroMainRouter.router.generator,
    );
  }
}

class MainScreen extends StatefulWidget {
  final MainTab initialTab;
  final MoreOption moreOption;
  final HomeOption homeOption;
  final int id;

  MainScreen(
      {@required this.initialTab, this.moreOption, this.homeOption, this.id});

  State<StatefulWidget> createState() {
    return _MainScreenState(
      initialTab,
      moreOption,
      homeOption,
      id,
    );
  }
}

class _MainScreenState extends State<MainScreen> {
  PersistentTabController _controller;
  // bool _hideNavBar;
  final MainTab _initialTab;
  final MoreOption _moreOption;
  final HomeOption _homeOption;
  final int _id;

  _MainScreenState(
    this._initialTab,
    this._moreOption,
    this._homeOption,
    this._id,
  );

  @override
  void initState() {
    super.initState();
    _controller =
        PersistentTabController(initialIndex: getInitialIndex(_initialTab));
    // _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomeRoute(),
      MessagesRoute(),
      SearchRoute(),
      ProfileRoute(),
      MoreRoute(_moreOption, _id),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(homeIcon),
        title: homePageTitle,
        activeColor: themeColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(messagesIcon),
        title: (messagesPageTitle),
        activeColor: themeColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(searchIcon),
        title: (searchPageTitle),
        activeColor: themeColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(profileIcon),
        title: (profilePageTitle),
        activeColor: themeColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(moreIcon),
        title: (morePageTitle),
        activeColor: themeColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AboutUsProvider()),
        ChangeNotifierProvider.value(value: ContactUsProvider()),
        ChangeNotifierProvider.value(value: FaqProvider()),
        ChangeNotifierProvider.value(value: ManualProvider()),
        ChangeNotifierProvider.value(value: PricingProvider()),
        ChangeNotifierProvider.value(value: RuleProvider()),
        ChangeNotifierProvider.value(value: BlogProvider()),
      ],
      child: MaterialApp(
        home: Scaffold(
          // drawer: Drawer(
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          //         const Text('This is the Drawer'),
          //       ],
          //     ),
          //   ),
          // ),
          body: PersistentTabView(
            controller: _controller,
            screens: _buildScreens(),
            confineInSafeArea: true,

            itemCount: 5,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            // hideNavigationBar: _hideNavBar,
            decoration: NavBarDecoration(
                colorBehindNavBar: themeColor,
                borderRadius: BorderRadius.circular(20.0)),
            popAllScreensOnTapOfSelectedTab: true,
            itemAnimationProperties: ItemAnimationProperties(
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 400),
            ),
            items: _navBarsItems(),
            navBarStyle: NavBarStyle.style9,
          ),
        ),
      ),
    );
  }
}

//.................... main features to do until 30 Azar, deadline of phase 1: ..........................
//TODO: add remained more pages: pricings, blog, manual, softWareTeam
//TODO: connect more pages to the server
//TODO: design blog and connect to server
//TODO: design home page and connect to server
