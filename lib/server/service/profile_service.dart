import 'package:firebase_auth/firebase_auth.dart';
import 'package:qltura/server/db/db_connect.dart';
import 'package:qltura/server/model/profile_interface.dart';
import 'package:qltura/server/service/iprofile_service.dart';

class ProfileService implements IProfileService {
  @override
  Future<String> createUserProfile(Profile userProfile) async {
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
}
