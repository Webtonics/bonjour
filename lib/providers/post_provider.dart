import 'package:bonjour/resources/firestore_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';

class PostProvider with ChangeNotifier {
  Post? _post;
  Post get getPost => _post!;

  Future<void> refreshPost() async {
    Stream<QuerySnapshot<Map<String, dynamic>>> post =
        await FirestoreMethods().getallPosts();

    _post = post as Post?;
    notifyListeners();
  }
}
