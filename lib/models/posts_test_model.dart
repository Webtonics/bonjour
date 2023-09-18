// import 'dart:typed_data';

// import 'package:bonjour/models/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Posts {
//   final String description;
//   final User user;
//   final Uint8List image;

//   Posts({
//     required this.description,
//     required this.user,
//     required this.image,
//   });
//   // mapping
//   Map<String, dynamic> toJson() =>
//       {'description': description, 'user': user, 'image': image};

//   //get object
//   static Posts fromJson(DocumentSnapshot snap) {
//     var snapshot = snap.data() as Map<String, dynamic>;
//     return Posts(
//         description: snapshot['description'],
//         user: snapshot['User'],
//         image: snapshot['image']);
//   }
// }
