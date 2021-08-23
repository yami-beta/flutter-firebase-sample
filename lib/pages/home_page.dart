import 'package:flutter/material.dart';
import 'package:flutter_firebase_sample/models/app_theme_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changePrimarySwatch =
        context.select<AppThemeModel?, void Function(MaterialColor)>(
            (theme) => theme?.changePrimarySwatch ?? (MaterialColor value) {});

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('テーマ変更'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: const Text('Blue'),
                  onPressed: () {
                    changePrimarySwatch(Colors.blue);
                  },
                ),
                ElevatedButton(
                  child: const Text('Indigo'),
                  onPressed: () {
                    changePrimarySwatch(Colors.indigo);
                  },
                ),
              ],
            ),
            const Text('画面遷移'),
            ElevatedButton(
              child: const Text('Introduction'),
              onPressed: () {
                Navigator.of(context).pushNamed('/introduction');
              },
            ),
          ],
        ),
      ),
    );
  }
}
