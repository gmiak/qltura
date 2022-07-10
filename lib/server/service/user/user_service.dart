import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:qltura/server/model/user_model.dart';
import 'package:qltura/server/service/user/iuser_service.dart';
import '../../db/db_connect.dart';

class UserService implements IUserService {
  @override
  Future<String> addUserToDb(UserQ user) async {
    final db = DBConnect();
    String res = "Some error occurred!";
    try {
      // ignore: await_only_futures
      await db
          .getFirestore()
          .collection('users')
          .doc(user.id)
          .set(user.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  @override
  Future<void> loginUser(String email, String password) async {
    final db = DBConnect();
    await db
        .getAuth()
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signoutUser() async {
    final db = DBConnect();
    await db.getAuth().signOut();
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
  Future<UserQ> getUser() async {
    final db = DBConnect();
    // Getting the current user from firestore
    User currentUser = db.getAuth().currentUser!; // The logged user
    DocumentSnapshot snapshot =
        await db.getFirestore().collection('users').doc(currentUser.uid).get();
    return UserQ.fromSnap(snapshot);
  }
}
