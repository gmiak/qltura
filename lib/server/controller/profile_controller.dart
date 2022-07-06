import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qltura/server/model/profile_interface.dart';
import 'package:qltura/server/model/profile_model.dart';
import 'package:qltura/server/service/profile_service.dart';
import 'package:qltura/server/service/profile_validation_service.dart';
//import 'package:flutter/material.dart';

class ProfileController {
  // sign up user and create user profile
  Future<String> signupAndCreateUserProfile({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    Profile userProfile = ProfileModel(email: email, username: username);

    try {
      // Validator
      if (!email.isValidEmail) {
        res = "Please Enter a valid Email!";
        return res;
      }
      /*if (!password.isValidPassword) {
        res =
            "Password must contain an uppercase, lowercase, numeric digit and special character";
        return res;
      // ignore: todo

      }*/

      /*if (!username.isValidName) {
        res = "Please Enter a valid Username!";
        return res;
      }*/
      if (email.isEmpty ||
          password.isEmpty ||
          username.isEmpty ||
          !email.isNotNull ||
          !password.isNotNull ||
          !username.isNotNull) {
        res = "Missing Data - Please try again!";
        return res;
      }
      // register the user
      final ps = ProfileService();
      UserCredential cred = await ps.signupUser(email, password);

      // Add the user to our database
      userProfile.id = cred.user!.uid;
      String userProfilePicUrl = await ps.loadUserProfilePic(
          userProfile.id!, file); // Load the user's profile image
      // ignore: avoid_print
      print(userProfilePicUrl);
      res = await ps.createUserProfile(userProfile, userProfilePicUrl);
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
