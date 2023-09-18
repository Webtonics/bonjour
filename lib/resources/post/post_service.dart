// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../models/posts_test_model.dart';
// import '../../models/user.dart';

// class PostMethod {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> postToDb(String description, Uint8List image, User user) async {
//     Posts post = Posts(description: description, user: user, image: image);
//     _firestore.collection('post').doc('uid').set(
//       post.toJson(),
//     );
//   }
// }
