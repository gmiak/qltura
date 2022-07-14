// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qltura/client/service/config/responsiveLayout/mobile_screen_layout.dart';
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          )
        ],
      ),
    );
  }

  // Page Appbar
  AppBar appBar() {
    return AppBar(
      backgroundColor: mobileBackgroundColor,
      leading: IconButton(
        icon: Icon(Icons.close),
        iconSize: 32,
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const MobileScreenLayout(),
            ),
            (route) => false,
          );
        },
      ),
      title: Text("Create post", style: const TextStyle(fontSize: 16.0)),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Post',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
