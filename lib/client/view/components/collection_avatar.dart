import 'package:flutter/material.dart';

import '../../service/utils/colors.dart';

class CollectionAvatar extends StatefulWidget {
  final String title;
  final String imageLink;
  final Widget pageLink;
  const CollectionAvatar(
      {Key? key,
      required this.title,
      required this.imageLink,
      required this.pageLink})
      : super(key: key);

  @override
  State<CollectionAvatar> createState() => _CollectionAvatarState();
}

class _CollectionAvatarState extends State<CollectionAvatar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {},
            child: Container(
              width: 62,
              height: 62,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appBackgroundColor,
                border: Border.all(color: collectionAvatarBorderColor),
              ),
              child: Image.asset(widget.imageLink),
            )),
        const SizedBox(height: 3),
        Text(
          widget.title,
          style: const TextStyle(color: textColor),
        ),
      ],
    );
  }
}
