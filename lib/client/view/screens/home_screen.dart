import 'package:flutter/material.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/view/screens/add_post_screen.dart';

import '../components/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Qltura',
        iconButtons: iconButtons(context),
      ),
      body: const Center(child: Text("This is home")),
    );
  }

  // Appbar
  List<IconButton> iconButtons(BuildContext context) {
    List<IconButton> buttons = <IconButton>[];
    // Add buttons 1
    buttons.add(
      IconButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const AddPostScreen(),
            ),
            (route) => false,
          );
        },
        icon: const Icon(
          Icons.add_circle_outline,
          color: logoColor,
          semanticLabel: 'Add',
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
          semanticLabel: 'Search',
          size: 25,
        ),
      ),
    );
    // Add buttons 3
    buttons.add(
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.email_outlined,
          color: logoColor,
          semanticLabel: 'Message',
          size: 25,
        ),
      ),
    );
    return buttons;
  }
}
