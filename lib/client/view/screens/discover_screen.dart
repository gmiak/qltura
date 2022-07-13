import 'package:flutter/material.dart';

import '../components/appbar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Discover',
        iconButtons: iconButtons(),
      ),
      body: const Center(child: Text("This is discover")),
    );
  }

  // Appbar
  List<IconButton> iconButtons() {
    List<IconButton> buttons = <IconButton>[];
    // Add buttons 1
    buttons.add(IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search),
      tooltip: 'Search Icon',
    ));
    return buttons;
  }
}
