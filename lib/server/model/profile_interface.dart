import 'dart:typed_data';

/// Profile interface
class Profile {
  String? id;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? gender;
  String? joined;
  String? bio;
  Uint8List? profilepic;
  List<String>? followers;
  List<String>? following;
}
