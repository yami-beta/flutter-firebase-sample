import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_sample/models/auth_model.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(context) {
    final signIn = context.select<
        AuthModel?,
        Future<FirebaseAuthException?> Function({
      required String email,
      required String password,
    })?>((auth) => auth?.signInWithEmailAndPassword);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'メールアドレス'),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'パスワード'),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          ElevatedButton(
            child: const Text('ログイン'),
            onPressed: () async {
              if (signIn == null) {
                return;
              }

              final error = await signIn(email: email, password: password);
              if (error != null) {
                return;
              }

              final navigator = Navigator.of(context);
              if (navigator.canPop()) {
                navigator.maybePop();
              } else {
                navigator.pushNamedAndRemoveUntil('/', (route) => false);
              }
            },
          ),
        ],
      ),
    );
  }
}
