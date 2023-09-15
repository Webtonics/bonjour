import 'dart:typed_data';

import 'package:bonjour/resources/authentication/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> getuserid() async {
    if (_auth.currentUser != null) {
      return _auth.currentUser!.uid;
    } else {
      throw UserNotFoundAuthException();
    }
  }

  //add image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, bool isPost, Uint8List profilePicture) async {
    Reference ref = _storage.ref().child(childName).child(_auth.currentUser!.uid
        .toString()
        .toString()); // this is to get where to put data, child name is different folders eg. app/profile/uid/image.png
    UploadTask uploadTask = ref.putData(profilePicture); //upload the data

    TaskSnapshot snap = await uploadTask; //get the snapshot
    String downloadUrl = await snap.ref
        .getDownloadURL(); // get the sownload url for easy access by our db
    return downloadUrl;
  }
}
