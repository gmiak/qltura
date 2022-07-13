import 'package:flutter/material.dart';
import '../../service/utils/colors.dart';

class Appbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<IconButton> iconButtons;
  Appbar({Key? key, required this.title, required this.iconButtons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mobileBackgroundColor,
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Playfair', fontSize: 26.0, letterSpacing: 2),
      ),
      actions: [
        for (var iconButton in iconButtons)
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              backgroundColor: secondaryColor,
              child: iconButton,
            ),
          ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
