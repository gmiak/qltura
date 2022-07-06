import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DBConnect {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  FirebaseAuth getAuth() {
    return _auth;
  }

  FirebaseFirestore getFirestore() {
    return _firestore;
  }

  FirebaseStorage getStorage() {
    return _storage;
  }
}
