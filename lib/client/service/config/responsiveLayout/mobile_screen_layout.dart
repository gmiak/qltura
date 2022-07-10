import 'package:flutter/material.dart';
import 'package:qltura/server/controller/user_controller.dart';

/// Mobile Layout Settings

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);
  void signout() {
    final us = UserController();
    us.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text("This is mobile"),
          IconButton(onPressed: signout, icon: const Icon(Icons.logout))
        ],
      )),
    );
  }
}
