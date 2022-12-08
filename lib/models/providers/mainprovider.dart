
import 'package:flutter/material.dart';
import 'package:todoapp/models/data/appdata.dart';

class MainProvider extends ChangeNotifier {

  String CurrentLangcode='ar';
  String CurrentLang = AppData.AppLang['ar'];
  void ChangeLanguage (String lang) {
    CurrentLangcode = lang;
    CurrentLang=AppData.AppLang[lang];
    notifyListeners();
}
}