import 'package:flutter/material.dart';

import '../components/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Qltura',
        iconButtons: iconButtons(),
      ),
      body: const Center(child: Text("This is home")),
    );
  }

  // Appbar
  List<IconButton> iconButtons() {
    List<IconButton> buttons = <IconButton>[];
    // Add buttons 1
    buttons.add(IconButton(
      onPressed: () {},
      icon: const Icon(Icons.add),
      tooltip: 'Add Icon',
    ));
    // Add buttons 2
    buttons.add(IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search),
      tooltip: 'Search Icon',
    ));
    // Add buttons 3
    buttons.add(IconButton(
      onPressed: () {},
      icon: const Icon(Icons.message),
      tooltip: 'Message Icon',
    ));
    return buttons;
  }
}
