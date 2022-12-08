// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:todoapp/models/data/appdata.dart';

class MainProvider extends ChangeNotifier {

  String CurrentLangcode = 'en';

  void ChangeLanguage( String k) {
    CurrentLangcode = k;
    notifyListeners();
  }
}
