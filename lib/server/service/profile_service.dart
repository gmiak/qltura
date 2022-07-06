import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:qltura/server/db/db_connect.dart';
import 'package:qltura/server/model/profile_interface.dart';
import 'package:qltura/server/service/iprofile_service.dart';

class ProfileService implements IProfileService {
  @override
  Future<UserCredential> signupUser(String email, String password) async {
    final db = DBConnect();
    // register the user
    UserCredential cred = await db.getAuth().createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
    return cred;
  }

  @override
  Future<String> createUserProfile(
      Profile userProfile, String userProfilePicUrl) async {
    final db = DBConnect();
    String res =
        "Something went wrong creating the your profile.\nPlease login and complete your the process!";
    try {
      await db.getFirestore().collection('users').doc(userProfile.id).set({
        'uid': userProfile.id,
        'email': userProfile.email,
        'firstname': userProfile.firstname,
        'lastname': userProfile.lastname,
        'username': userProfile.username,
        'gender': userProfile.gender,
        'joined': DateTime.now().toString(),
        'bio': userProfile.bio,
        'profilepic': userProfilePicUrl,
        'followers': userProfile.followers,
        'following': userProfile.following,
      });
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<String> loadUserProfilePic(String uid, Uint8List data) async {
    final db = DBConnect();

    // Adding image to firebase storage
    Reference ref = db
        .getStorage()
        .ref()
        .child("users")
        .child(uid)
        .child("profile_picture");
    // Putting the file in this location
    UploadTask uploadTask = ref.putData(data);
    // Waiting for the task to be done
    TaskSnapshot snap = await uploadTask;
    // Putting the download url in res. Download url = profile pic location
    String res = await snap.ref.getDownloadURL();
    return res;
  }

  @override
  Future<List<String>> getUserFollowers() {
    // TODO: implement getUserFollowers
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getUserFollowing() {
    // TODO: implement getUserFollowing
    throw UnimplementedError();
  }

  @override
  Future<Profile> getUserProfile() {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Profile> getUserProfileById() {
    // TODO: implement getUserProfileById
    throw UnimplementedError();
  }
}
