import 'package:flutter/material.dart';

import '../../service/utils/colors.dart';
import '../components/appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Profile',
        iconButtons: iconButtons(),
      ),
      body: const Center(child: Text("This is profile")),
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
          Icons.manage_accounts,
          color: logoColor,
          semanticLabel: 'Manage Accounts',
          size: 25,
        ),
      ),
    );
    // Add buttons 2
    buttons.add(
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: logoColor,
          semanticLabel: 'Profile Search',
          size: 25,
        ),
      ),
    );
    return buttons;
  }
}
