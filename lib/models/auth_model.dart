import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  User? firebaseUser;

  AuthModel() {
    init();
  }

  void init() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      firebaseUser = user;
      notifyListeners();
    });
  }
}
