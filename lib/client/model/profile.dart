class Profile {
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String gender;
  final String joined;
  final String bio;
  final String profilepic;
  final List followers;
  final List following;

  const Profile({
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
}
