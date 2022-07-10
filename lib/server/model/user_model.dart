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
  UserQ({required this.username, required this.email});

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
}
