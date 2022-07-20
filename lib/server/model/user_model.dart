import 'package:cloud_firestore/cloud_firestore.dart';

class UserQ {
  String id = "";
  String firstname = "";
  String lastname = "";
  String username;
  String email;
  String gender = "";
  String joined = DateTime.now().toString();
  String bio = "";
  String profilepic = "";
  List followers = [];
  List following = [];
  // Constructors
  UserQ({required this.username, required this.email});
  UserQ.fromDB({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.gender,
    required this.joined,
    required this.bio,
    required this.profilepic,
    required this.followers,
    required this.following,
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "gender": gender,
        "joined": joined,
        "bio": bio,
        "profilepic": profilepic,
        "followers": followers,
        "following": following,
      };
  static UserQ fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return UserQ.fromDB(
      id: snap['id'],
      firstname: snap['firstname'],
      lastname: snap['lastname'],
      username: snap['username'],
      email: snap['email'],
      gender: snap['gender'],
      joined: snap['joined'],
      bio: snap['bio'],
      profilepic: snap['profilepic'],
      followers: snap['followers'],
      following: snap['following'],
    );
  }
}
