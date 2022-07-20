import 'dart:core';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qltura/client/view/screens/message_screen.dart';
import 'package:qltura/client/view/screens/search_screen.dart';

import '../../view/screens/add_post_screen.dart';
import 'colors.dart';

// Shows snackbar
showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}

// Selects image from source
pickImage(ImageSource source) async {
  // ignore: no_leading_underscores_for_local_identifiers
  final ImagePicker _imagePicker = ImagePicker();
  // ignore: no_leading_underscores_for_local_identifiers
  XFile? _file = await _imagePicker.pickImage(source: source);

  //Checks if the user press the button without uploading any image
  if (_file != null) {
    return await _file.readAsBytes();
  }
  // ignore: avoid_print
  print("No image selected");
}

// Load default avatar when the user did not any select profile image
Future<Uint8List> loadDefaultAvatar() async {
  final Uint8List img =
      (await rootBundle.load('assets/avatar.png')).buffer.asUint8List();
  return img;
}

// Returns iconbutton add
IconButton getBtnAdd(BuildContext context) {
  IconButton button = IconButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AddPostScreen(),
        ),
      );
    },
    icon: const Icon(
      FeatherIcons.plusCircle,
      color: logoColor,
      semanticLabel: 'Add',
      size: 25,
    ),
  );
  return button;
}

// Returns iconbutton search
IconButton getBtnSearch(BuildContext context) {
  IconButton button = IconButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        ),
      );
    },
    icon: const Icon(
      FeatherIcons.search,
      color: logoColor,
      semanticLabel: 'Search',
      size: 25,
    ),
  );
  return button;
}

// Returns iconbutton message
IconButton getBtnMessage(BuildContext context) {
  IconButton button = IconButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MessageScreen(),
        ),
      );
    },
    icon: const Icon(
      FeatherIcons.mail,
      color: logoColor,
      semanticLabel: 'Message',
      size: 25,
    ),
  );
  return button;
}

// Returns iconbutton manage account
IconButton getBtnManageAccount(BuildContext context) {
  IconButton button = IconButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MessageScreen(),
        ),
      );
    },
    icon: const Icon(
      FeatherIcons.sliders,
      color: logoColor,
      semanticLabel: 'Manage Accounts',
      size: 25,
    ),
  );
  return button;
}

// Returns iconbutton settings
IconButton getBtnSettings(BuildContext context) {
  IconButton button = IconButton(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MessageScreen(),
        ),
      );
    },
    icon: const Icon(
      FeatherIcons.settings,
      color: logoColor,
      semanticLabel: 'Settings',
      size: 25,
    ),
  );
  return button;
}
