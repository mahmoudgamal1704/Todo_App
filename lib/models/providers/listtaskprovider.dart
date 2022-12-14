import 'package:flutter/material.dart';

import '../../shared/network/local/firebase_utls.dart';

class ListTaskProvider extends ChangeNotifier {
  DateTime currentDate = DateTime.now();
  // DateTime firstDate=currentDate
  List tasks = [];

  getTaskfromFirestore(DateTime date) async {
    currentDate=date;
    tasks.clear();
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
          tasks.add(element.data());
          // print(element.data().id);
        });
      }
      // print('dfdd ${tasks.length}');
      notifyListeners();
      // return true;
    });
  }
}
