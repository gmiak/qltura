import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qltura/server/model/user_model.dart';

abstract class IUserService {
  Future<UserCredential> signupUser(
    String email,
    String password,
  );
  Future<void> loginUser(String email, String password);
  Future<void> signoutUser();
  Future<String> addUserToDb(UserQ user);
  Future<String> loadUserProfilePic(String uid, Uint8List data);
  Future<UserQ> getUser();
}
