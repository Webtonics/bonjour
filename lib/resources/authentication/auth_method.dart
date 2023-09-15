import 'dart:typed_data';

import 'package:bonjour/resources/authentication/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
  //step 1 create instance of firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // step 3 create instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //step 2: function to sign up the user
  Future<String> signupUser({
    required String username,
    required String email,
    required String password,
    required String bio,
    // required Uint8List file
  }) async {
    String res = "Some Error Ocurred";
    try {
      if (username.isNotEmpty ||
              email.isNotEmpty ||
              password.isNotEmpty ||
              bio.isNotEmpty
          // file != null
          ) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //add user to db
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        });
        res = 'success';
      }
    } on EmailAlreadyinUseAuthException {
      print("Email Already Exist");
    } on WeakPasswordAuthException {
      print("WeakPassword");
    } on InvalidEmailAuthException {
      print("Invalid Password");
    } on MissingPasswordAuthException {
      print("Missing password");
    } on GenericAuthException {
      print("Unkown Error Occurred");
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
