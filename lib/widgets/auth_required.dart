import 'package:flutter/material.dart';
import 'package:flutter_firebase_sample/models/auth_model.dart';
import 'package:flutter_firebase_sample/pages/login_page.dart';
import 'package:provider/provider.dart';

class AuthRequired extends StatelessWidget {
  final Widget child;

  const AuthRequired({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(context) {
    final authStatus = context.select<AuthModel?, AuthStatus>(
        (auth) => auth?.authStatus ?? AuthStatus.initial);

    if (authStatus == AuthStatus.signIn) {
      return child;
    }

    if (authStatus == AuthStatus.signOut) {
      return const LoginPage();
    }

    return _AuthLoading();
  }
}

class _AuthLoading extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('処理中'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
