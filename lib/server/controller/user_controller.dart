import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:qltura/server/model/user_model.dart';
import 'package:qltura/server/service/user/user_service.dart';
import 'package:qltura/server/service/validation_service.dart';

class UserController {
  Future<String> signup({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some error occurred!";
    try {
      if (!username.isValidUserName) {
        res = "Invalid Username!\n(Valid username format: gmiak, Gmiak_123).";
        return res;
      }
      if (!email.isValidEmail) {
        res = "The email is badly formated!";
        return res;
      }
      if (password.length < 8) {
        res = "Password must contain at least 8 characters!";
        return res;
      }
      if (!password.isContaindigit) {
        res = "Password must contain at least one digit [0-9]";
        return res;
      }
      if (!password.isContainLowercase) {
        res = "Password must contain at least one lowercase [a-z]";
        return res;
      }
      if (!password.isContainUppercase) {
        res = "Password must contain at least one uppercase [A-Z]!";
        return res;
      }
      if (!password.isContainSpecialCharacter) {
        res = "Password must contain at least one special character [*.!%#&]";
        return res;
      }
      // User's Registration
      UserService userService = UserService();
      UserCredential cred = await userService.signupUser(email, password);
      // Adding user to the database
      UserQ user = UserQ(username: username, email: email);
      user.id = cred.user!.uid;
      // load profile picture
      String userProfilePicUrl =
          await userService.loadUserProfilePic(user.id, file);
      user.profilepic = userProfilePicUrl;
      res = await userService.addUserToDb(user);
      return res;
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Logging in the user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured!";
    UserService userService = UserService();
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await userService.loginUser(email, password);
        res = "success";
      } else {
        res = "Please enter all the fields.";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        res = "User not found!";
      }
      if (e.code == "wrong-password") {
        res = "Wrong password";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Logging out
  Future<void> logout() async {
    final us = UserService();
    us.signoutUser();
  }

  // Getting user data
  Future<UserQ> getUserdata() async {
    UserQ res = UserQ(username: "Error", email: "error@error.com");
    UserService userService = UserService();
    try {
      res = await userService.getUser();
    } catch (err) {
      res.bio = err.toString();
    }
    return res;
  }
}
