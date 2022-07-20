import 'package:flutter/material.dart';
import 'package:qltura/client/service/utils/utils_uno.dart';
import 'package:qltura/server/controller/user_controller.dart';
import '../../service/utils/colors.dart';
import '../components/appbar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Menu',
        iconButtons: iconButtons(context),
      ),
      body: Center(
          child: IconButton(
              onPressed: logout,
              icon: const Icon(
                Icons.logout,
                color: primaryColor,
              ))),
    );
  }

  // Appbar
  List<IconButton> iconButtons(BuildContext context) {
    List<IconButton> buttons = <IconButton>[];
    // Add buttons 1
    buttons.add(getBtnSettings(context));
    // Add buttons 2
    buttons.add(getBtnSearch(context));
    return buttons;
  }

  logout() async {
    await UserController().logout();
  }
}
