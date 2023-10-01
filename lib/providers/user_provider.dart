import 'package:bonjour/models/user.dart';
import 'package:bonjour/resources/authentication/auth_method.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User? get getUser => _user;
  //function to get uer details

  Future<void> refreshUser() async {
    try {
      User user = await _authMethods.getDetails();

      _user = user;
      notifyListeners();
    } catch (e) {
      print("Error caught is: $e");
    }
  }
}
