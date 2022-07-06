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
  String? profilepic;

  @override
  String? username;

  // Signup constructor
  ProfileModel({this.email, this.username});

  @override
  String? bio;
}
