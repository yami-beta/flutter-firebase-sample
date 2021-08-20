import 'package:flutter/material.dart';

class AppThemeModel extends ChangeNotifier {
  var primarySwatch = Colors.blue;

  void changePrimarySwatch(MaterialColor value) {
    primarySwatch = value;
    notifyListeners();
  }
}
