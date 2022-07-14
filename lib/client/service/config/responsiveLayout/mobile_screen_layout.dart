// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qltura/client/service/config/provider/user_provider.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/service/utils/global_variables.dart';
import 'package:qltura/client/view/screens/discover_screen.dart';
import 'package:qltura/client/view/screens/home_screen.dart';
import 'package:qltura/client/view/screens/menu_screen.dart';
import 'package:qltura/client/view/screens/notifications_screen.dart';
import 'package:qltura/client/view/screens/profile_screen.dart';
import 'package:qltura/server/controller/user_controller.dart';
import 'package:qltura/server/model/user_model.dart';

/// Mobile Layout Settings

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void signout() {
    final us = UserController();
    us.logout();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserQ? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(
        physics:
            NeverScrollableScrollPhysics(), // can be usefull when implemented the scrolling categories on the user's profile
        controller: pageController,
        onPageChanged: onPageChanged,
        children: appHomeScreens,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        activeColor: secondaryColor,
        inactiveColor: secondaryColor,
        onTap: navigationTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _page == 0 ? brandColor : secondaryColor,
              ),
              label: 'Home',
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
                color: _page == 1 ? brandColor : secondaryColor,
              ),
              label: 'Discover',
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _page == 2 ? brandColor : secondaryColor,
              ),
              label: 'Profile',
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: _page == 3 ? brandColor : secondaryColor,
              ),
              label: 'Notifications',
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                color: _page == 4 ? brandColor : secondaryColor,
              ),
              label: 'Menu',
              backgroundColor: primaryColor),
        ],
      ),
    );
  }
}
