import 'package:flutter/material.dart';
import 'package:flutter_firebase_sample/models/auth_model.dart';
import 'package:provider/provider.dart';

class SwitchAuthWidget extends StatelessWidget {
  final Widget child;
  final Widget fallbackChild;

  const SwitchAuthWidget({
    Key? key,
    required this.child,
    required this.fallbackChild,
  }) : super(key: key);

  @override
  Widget build(context) {
    final authStatus = context.select<AuthModel?, AuthStatus>(
        (auth) => auth?.authStatus ?? AuthStatus.initial);

    if (authStatus == AuthStatus.signIn) {
      return child;
    }

    return fallbackChild;
  }
}
