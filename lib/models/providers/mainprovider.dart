
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../shared/network/local/firebase_utls.dart';
import '../data/task.dart';
class MainProvider extends ChangeNotifier {

  String CurrentLangcode = 'en';
  ThemeMode Currentmode = ThemeMode.light;
  List tasks = [];
  void ChangeLanguage( Map k,String v) {
    var key = k.keys.firstWhere(
            (element) => k[element] == v
    );
    CurrentLangcode = key.toString();
    notifyListeners();
  }
  void ChangeMode( Map k,String v) {
    var key = k.keys.firstWhere(
            (element) => k[element] == v
    );
    Currentmode = key;
    notifyListeners();
  }
  getTaskfromFirestore()  {
    tasks.clear();
   var collection = getTaskCollection();
    collection.get().then((value) {
      if (value.docs.isNotEmpty){
        value.docs.forEach((element) {
          tasks.add(element.data());
          // print(element.data().id);
        });
      }
      // print('dfdd ${tasks.length}');
      notifyListeners();
      return true;
    });

  }
}
