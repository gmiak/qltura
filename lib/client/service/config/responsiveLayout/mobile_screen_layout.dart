import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qltura/client/service/config/provider/user_provider.dart';
import 'package:qltura/server/controller/user_controller.dart';
import 'package:qltura/server/model/user_model.dart';

/// Mobile Layout Settings

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  void signout() {
    final us = UserController();
    us.logout();
  }

  @override
  Widget build(BuildContext context) {
    UserQ? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(user.username),
          IconButton(onPressed: signout, icon: const Icon(Icons.logout))
        ],
      )),
    );
  }
}
