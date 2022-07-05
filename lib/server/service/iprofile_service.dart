import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:qltura/server/model/profile_interface.dart';

abstract class IProfileService {
  Future<UserCredential> signupUser(
    String email,
    String password,
  );
  Future<String> createUserProfile(Profile userProfile);
  Future<Profile> getUserProfile();
  Future<Profile> getUserProfileById();
  Future<List<String>> getUserFollowers();
  Future<List<String>> getUserFollowing();
}
