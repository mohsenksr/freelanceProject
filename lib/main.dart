import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project_new_style/Routes/homeRoute.dart';
import 'package:project_new_style/Routes/messagesRoute.dart';
import 'package:project_new_style/Routes/moreRoute.dart';
import 'package:project_new_style/Routes/profileRoute.dart';
import 'package:project_new_style/Routes/searchRoute.dart';
import 'package:project_new_style/Styles/colors.dart';

import 'Styles/textStyles.dart';

void main() => runApp(CustomWidgetExample());

class CustomWidgetExample extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _CustomWidgetExampleState();
  }
}

class _CustomWidgetExampleState extends State<CustomWidgetExample> {
  PersistentTabController _controller;
  // bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    // _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomeRoute(),
      MessagesRoute(),
      SearchRoute(),
      ProfileRoute(),
      MoreRoute(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "خانه",
        activeColor: themeColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message),
        title: ("پیام‌ها"),
        activeColor: themeColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("جستجو"),
        activeColor: themeColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("پروفایل"),
        activeColor: themeColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.more_horiz),
        title: ("بیشتر"),
        activeColor: themeColor,
        inactiveColor: Colors.grey,
        titleStyle: TextStyle(fontFamily: mainFontFamily),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'پروژه فریلنس',
            style: TextStyle(color: Colors.white, fontFamily: mainFontFamily),
          ),
          backgroundColor: themeColor,
        ),
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
            duration: Duration(milliseconds: 200),
          ),
          items: _navBarsItems(),
          navBarStyle: NavBarStyle.style9,
        ),
      ),
    );
  }
}

//TODO: route handling: example.com/home, example.com/more, example.com/...
//TODO: route handling inside specific tab: example.com/about-us (it has to go to the more tab and then go to AboutUs)

//.................... main features to do until 30 Azar, deadline of phase 1: ..........................
//TODO: add more pages (designed by Mohammadjavad)
//TODO: connect more pages to the server
//TODO: design blog and connect to server
//TODO: design home page and connect to server
