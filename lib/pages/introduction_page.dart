import 'package:flutter/material.dart';
import 'package:flutter_firebase_sample/models/auth_model.dart';
import 'package:flutter_firebase_sample/widgets/auth_required.dart';
import 'package:provider/provider.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final signOut = context
        .select<AuthModel?, Future<void> Function()?>((auth) => auth?.signOut);

    return AuthRequired(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Introduction'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('説明'),
              ElevatedButton(
                child: const Text('ログアウト'),
                onPressed: () async {
                  if (signOut != null) {
                    await signOut();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/", (route) => false);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
