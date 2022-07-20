// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:qltura/client/service/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Space
            SizedBox(height: 5),
            // Divider
            Divider(
              color: collectionAvatarBorderColor,
              height: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            )
          ],
        ),
      ),
    );
  }

  // Page Appbar
  AppBar appBar() {
    return AppBar(
      backgroundColor: appBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          FeatherIcons.chevronLeft,
          color: logoColor,
        ),
        iconSize: 30,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text("Create post", style: const TextStyle(color: primaryColor)),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            FeatherIcons.checkCircle,
            color: blueColor,
          ),
          iconSize: 30,
          onPressed: () {},
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
