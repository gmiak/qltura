import 'package:flutter/material.dart';
import 'package:qltura/client/service/utils/utils_uno.dart';
import '../components/appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Notifications',
        iconButtons: iconButtons(context),
      ),
      body: const Center(child: Text("This is notification")),
    );
  }

  // Appbar
  List<IconButton> iconButtons(BuildContext context) {
    List<IconButton> buttons = <IconButton>[];
    // Add buttons 1
    buttons.add(getBtnSearch(context));
    return buttons;
  }
}
