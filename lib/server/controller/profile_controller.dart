import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qltura/server/model/profile_interface.dart';
import 'package:qltura/server/model/profile_model.dart';
import 'package:qltura/server/service/profile_service.dart';
import 'package:qltura/server/service/validation_service.dart';
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
      // Validation
      if (!email.isValidEmail) {
        res = "Please Enter a valid Email!";
        return res;
      }
      if (!password.isValidPassword) {
        res =
            "Password must contain at least; eight characters, one uppercase letter, one lowercase letter, one number and one special character";
        return res;
      }

      if (!username.isValidUserName) {
        res =
            "Please Enter a valid Username e.g, Gmiak, Tito_123, tito_123 (2-10 characters).";
        return res;
      }

      // Register the user
      final ps = ProfileService();
      UserCredential cred = await ps.signupUser(email, password);

      // Add the user to the database
      userProfile.id = cred.user!.uid;
      String userProfilePicUrl = await ps.loadUserProfilePic(
          userProfile.id!, file); // Load the user's profile image
      res = await ps.createUserProfile(userProfile, userProfilePicUrl);
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = "The email is badly formated";
      }
      if (err.code == 'weak-password') {
        res = "Password should be at least 6 characters";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
