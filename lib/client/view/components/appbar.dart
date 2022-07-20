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
      backgroundColor: appBackgroundColor,
      elevation: 0,
      title: Text(
        title,
        style: title == 'Qltura'
            ? const TextStyle(
                fontFamily: 'Rochester', fontSize: 35.0, color: logoColor)
            : const TextStyle(
                fontSize: 25,
                color: logoColor,
              ),
      ),
      actions: [
        for (var iconButton in iconButtons)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: iconCircleColor),
                child: Center(child: iconButton)),
          ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
