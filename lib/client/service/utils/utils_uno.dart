import 'dart:core';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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