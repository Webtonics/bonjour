import 'dart:typed_data';

import 'package:bonjour/resources/storage/storage_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import '../models/post.dart';
import '../models/posts_test_model.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //upload post
  Future<String> uploadPost(String profileImage, String description,
      Uint8List file, String uid, String username) async {
    String res = 'Some error occurs';
    String postId = const Uuid().v1();

    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', true, file);

      Post post = Post(
          username: username,
          description: description,
          uid: uid,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profileImage: profileImage,
          likes: []);

      await _firestore.collection('posts').doc(postId).set(
            post.toJson(),
          );
      res = "Success";
    } catch (e) {
      res = " Error: ${e.toString()}";
    }
    return res;
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getallPosts() async {
    Stream<QuerySnapshot<Map<String, dynamic>>> documentSnapshot =
        _firestore.collection('posts').snapshots();
    // DocumentSnapshot documentSnapshot =   _firestore.collection('posts').snapshots();

    // return Post.fromSnap(documentSnapshot);
    return documentSnapshot;
  }
}
