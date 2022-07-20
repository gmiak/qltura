import 'package:flutter/material.dart';
import 'package:qltura/client/service/utils/utils_uno.dart';
import '../components/appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Profile',
        iconButtons: iconButtons(context),
      ),
      body: const Center(child: Text("This is profile")),
    );
  }

  // Appbar
  List<IconButton> iconButtons(BuildContext context) {
    List<IconButton> buttons = <IconButton>[];
    // Add buttons 1
    buttons.add(getBtnAdd(context));
    // Add buttons 2
    buttons.add(getBtnSearch(context));
    return buttons;
  }
}
