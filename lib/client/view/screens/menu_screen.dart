import 'package:flutter/material.dart';
import 'package:qltura/server/controller/user_controller.dart';
import '../components/appbar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Menu',
        iconButtons: iconButtons(),
      ),
      body: Center(
          child: IconButton(onPressed: logout, icon: Icon(Icons.logout))),
    );
  }

  // Appbar
  List<IconButton> iconButtons() {
    List<IconButton> buttons = <IconButton>[];
    // Add buttons 1
    buttons.add(IconButton(
      onPressed: () {},
      icon: const Icon(Icons.settings),
      tooltip: 'Settings Icon',
    ));
    // Add buttons 2
    buttons.add(IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search),
      tooltip: 'Search Icon',
    ));
    return buttons;
  }

  logout() async {
    await UserController().logout();
  }
}
