import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  //add properties
  final String username;
  final String description;
  final String uid;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profileImage;
  final likes;

  Post(
      {required this.username,
      required this.description,
      required this.uid,
      required this.postId,
      required this.datePublished,
      required this.postUrl,
      required this.profileImage,
      required this.likes});

  //convert the object to Json because firebase stores as a map
  Map<String, dynamic> toJson() => {
        'username': username,
        'description': description,
        'uid': uid,
        'postId': postId,
        'datePublished': datePublished,
        'postUrl': postUrl,
        'profileImage': profileImage,
        'likes': likes
      };

  //Convert the json to Object i.e usermodel
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      datePublished: snapshot['datePublished'],
      description: snapshot['description'],
      likes: 0,
      postId: snapshot['likes'],
      postUrl: snapshot['postUrl'],
      profileImage: snapshot['profileImage'],
      uid: snapshot['uid'],
      username: snapshot['username'],
    );
  }
}
