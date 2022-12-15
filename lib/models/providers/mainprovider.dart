import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  String CurrentLangcode = 'en';
  ThemeMode Currentmode = ThemeMode.light;

  void ChangeLanguage(Map k, String v) {
    var key = k.keys.firstWhere((element) => k[element] == v);
    CurrentLangcode = key.toString();
    notifyListeners();
  }

  void ChangeMode(Map k, String v) {
    var key = k.keys.firstWhere((element) => k[element] == v);
    Currentmode = key;
    notifyListeners();
  }
}
