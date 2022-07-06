import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qltura/server/model/profile_interface.dart';

abstract class IProfileService {
  Future<UserCredential> signupUser(
    String email,
    String password,
  );
  Future<String> createUserProfile(Profile userProfile, String profilePicUrl);
  Future<String> loadUserProfilePic(String uid, Uint8List data);
  Future<Profile> getUserProfile();
  Future<Profile> getUserProfileById();
  Future<List<String>> getUserFollowers();
  Future<List<String>> getUserFollowing();
}
