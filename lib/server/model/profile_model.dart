import 'dart:typed_data';

import 'package:qltura/server/model/profile_interface.dart';

class ProfileModel implements Profile {
  @override
  String? email;

  @override
  String? firstname;

  @override
  List<String>? followers;

  @override
  List<String>? following;

  @override
  String? gender;

  @override
  String? id;

  @override
  String? joined;

  @override
  String? lastname;

  @override
  Uint8List? profilepic;

  @override
  String? username;

  // Signup
  ProfileModel({this.email, this.id, this.username});

  @override
  String? bio;
}
