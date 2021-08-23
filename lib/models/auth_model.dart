import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthStatus { initial, signIn, signOut }

class AuthModel extends ChangeNotifier {
  User? firebaseUser;
  AuthStatus authStatus = AuthStatus.initial;

  AuthModel() {
    init();
  }

  void init() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        firebaseUser = null;
        authStatus = AuthStatus.signOut;
      } else {
        firebaseUser = user;
        authStatus = AuthStatus.signIn;
      }
      notifyListeners();
    });
  }
}
