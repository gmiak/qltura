import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../service/utils/colors.dart';
import '../components/appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Notifications',
        iconButtons: iconButtons(),
      ),
      body: const Center(child: Text("This is notification")),
    );
  }

  // Appbar
  List<IconButton> iconButtons() {
    List<IconButton> buttons = <IconButton>[];
    // Add buttons 1
    buttons.add(
      IconButton(
        onPressed: () {},
        icon: const Icon(
          FeatherIcons.search,
          color: logoColor,
          semanticLabel: 'Manage Search',
          size: 25,
        ),
      ),
    );
    return buttons;
  }
}
