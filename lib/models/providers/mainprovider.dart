import 'package:flutter/material.dart';

import '../../shared/network/local/firebase_utls.dart';
import '../data/appdata.dart';

class MainProvider extends ChangeNotifier {
  String CurrentLangcode = 'en';
  ThemeMode Currentmode = ThemeMode.light;
  DateTime currentDate = DateTime.now();
  // List tasks = [];
// Provider listprov = Provider
  void ChangeLanguage(Map k, String v) {
    var key = k.keys.firstWhere((element) => k[element] == v);
    CurrentLangcode = key.toString();
    notifyListeners();
  }
  getTaskfromFirestore(DateTime date) async {
    currentDate=date;
    AppData.TasksList.clear();
    var collection = getTaskCollection();
    collection
        .where('date',
        isGreaterThanOrEqualTo: currentDate.subtract(Duration(hours: currentDate.hour,
            minutes: currentDate.minute,
            seconds:currentDate.second,
            milliseconds: currentDate.millisecond,
            microseconds:currentDate.microsecond))
            .microsecondsSinceEpoch).where('date',
        isLessThan: currentDate.add(Duration(days: 1)).subtract(Duration(hours: currentDate.hour,
            minutes: currentDate.minute,
            seconds:currentDate.second,
            milliseconds: currentDate.millisecond,
            microseconds:currentDate.microsecond))
            .microsecondsSinceEpoch)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          AppData.TasksList.add(element.data());
        });
      }
      notifyListeners();
    });
  }
  void refreshlist(){
    notifyListeners();
  }
  void ChangeMode(Map k, String v) {
    var key = k.keys.firstWhere((element) => k[element] == v);
    Currentmode = key;
    notifyListeners();
  }
}
