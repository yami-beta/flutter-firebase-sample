import 'package:flutter/material.dart';
import 'package:flutter_firebase_sample/widgets/auth_required.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return AuthRequired(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Introduction'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('説明'),
            ],
          ),
        ),
      ),
    );
  }
}
