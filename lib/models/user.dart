import 'package:cloud_firestore/cloud_firestore.dart';

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

  //Convert the json to Object i.e usermodel
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        username: snapshot['username'],
        email: snapshot['email'],
        uid: snapshot['uid'],
        photoUrl: snapshot['photoUrl'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following']);
  }
}
