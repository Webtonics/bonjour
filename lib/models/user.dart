class User {
  //add properties
  final String username;
  final String email;
  final String uid;
  final String photoUrl;
  final String bio;
  final List followers;
  final List following;

  User(
      {required this.username,
      required this.email,
      required this.uid,
      required this.photoUrl,
      required this.bio,
      required this.followers,
      required this.following});

  //convert the object to Json because firebase stores as a map
  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'uid': uid,
        'photoUrl': photoUrl,
        'bio': bio,
        'followers': followers,
        'following': following,
      };
}
