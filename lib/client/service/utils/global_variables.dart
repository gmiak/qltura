import 'package:flutter/material.dart';

import '../../view/components/collection_avatar.dart';
import '../../view/screens/discover_screen.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/menu_screen.dart';
import '../../view/screens/notifications_screen.dart';
import '../../view/screens/profile_screen.dart';
import '../config/responsiveLayout/mobile_screen_layout.dart';

const webScreenSize = 600;
const appHomeScreens = [
  HomeScreen(),
  DiscoverScreen(),
  ProfileScreen(),
  NotificationScreen(),
  MenuScreen()
];
// Returns collection avatar
List<Widget> tenCollectionsOnTop() {
  List<Widget> listWidget = <Widget>[];
  // Collection 1
  listWidget.add(const CollectionAvatar(
    title: "Musics",
    imageLink: "assets/music.png",
    pageLink: MobileScreenLayout(),
  ));
  listWidget.add(const SizedBox(width: 20.0));
  // Collection 2
  listWidget.add(const CollectionAvatar(
    title: "Movies",
    imageLink: "assets/movie.png",
    pageLink: MobileScreenLayout(),
  ));
  listWidget.add(const SizedBox(width: 20.0));
  // Collection 3
  listWidget.add(const CollectionAvatar(
    title: "Books",
    imageLink: "assets/book.png",
    pageLink: MobileScreenLayout(),
  ));
  listWidget.add(const SizedBox(width: 20.0));
  // Collection 4
  listWidget.add(const CollectionAvatar(
    title: "Watches",
    imageLink: "assets/watch.png",
    pageLink: MobileScreenLayout(),
  ));
  listWidget.add(const SizedBox(width: 20.0));
  // Collection 5
  listWidget.add(const CollectionAvatar(
    title: "Cars",
    imageLink: "assets/car.png",
    pageLink: MobileScreenLayout(),
  ));
  listWidget.add(const SizedBox(width: 20.0));
  // Collection 6
  listWidget.add(const CollectionAvatar(
    title: "Shoes",
    imageLink: "assets/shoes.png",
    pageLink: MobileScreenLayout(),
  ));
  listWidget.add(const SizedBox(width: 20.0));
  return listWidget;
}

// Returns list of item-example
List<String> searchList() {
  List<String> searchItems = <String>[];
  searchItems.add("assets/music1.png");
  searchItems.add("assets/music2.png");
  searchItems.add("assets/music3.png");
  searchItems.add("assets/car2.png");
  searchItems.add("assets/car3.png");
  searchItems.add("assets/car4.png");
  searchItems.add("assets/music4.png");
  searchItems.add("assets/music5.png");
  searchItems.add("assets/music6.png");
  searchItems.add("assets/car1.png");
  searchItems.add("assets/car5.png");
  searchItems.add("assets/car6.png");
  return searchItems;
}
