import 'dart:typed_data';

import 'package:bonjour/models/user.dart' as model;
import 'package:bonjour/resources/authentication/auth_exception.dart';
import 'package:bonjour/resources/storage/storage_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
  //step 1 create instance of firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // step 3 create instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //instatiate our model class

  //Get current user
  Future<model.User> getDetails() async {
    User currentuser = _auth.currentUser!;

    /// to get the currnt users uid
    DocumentSnapshot documentSnapshot = await _firestore
        .collection('users')
        .doc(currentuser.uid)
        .get(); // to see details of the current user

    return model.User.fromSnap(documentSnapshot);
  }

  //step 2: function to sign up the user
  Future<String> signupUser(
      {required String username,
      required String email,
      required String password,
      required String bio,
      required Uint8List file}) async {
    String res = "Some Error Ocurred";
    try {
      if (username.isNotEmpty ||
              email.isNotEmpty ||
              password.isNotEmpty ||
              bio.isNotEmpty
          // ||
          // file != null
          ) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage("profilePics", false, file);

        model.User user = model.User(
            username: username,
            email: email,
            uid: cred.user!.uid,
            photoUrl: photoUrl,
            bio: bio,
            followers: [],
            following: []);
        //add user to db
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = 'Success';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyinUseAuthException();
      } else if (e.code == 'missing-password') {
        throw MissingPasswordAuthException();
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //login user
  Future<String> signInUser(String email, String password) async {
    String result = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "Success";
      } else {
        result = "Please fill all the field";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException;
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException;
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

  //get Current user ID
  // Future<String?> getUser() async {
  //   String userID = await _auth.currentUser!.uid;
  //   return userID;
  //   // return _auth.currentUser?.uid;
  // }

  // getUseriD() {
  //   String userID = _auth.currentUser!.uid;
  //   return userID;
  //   // return _auth.currentUser?.uid;
  // }

  //Logout user
  Future<void> logOutUser() async {
    await _auth.signOut();
  }
}
