import 'package:flutter/material.dart';
import 'package:todoapp/models/data/appdata.dart';

import '../../shared/network/local/firebase_utls.dart';
import '../data/task.dart';

class ListTaskProvider extends ChangeNotifier {
  DateTime currentDate = DateTime.now();

  var titleController = TextEditingController();
  var discrpController = TextEditingController();

  void SelectDate(BuildContext context) async {
    DateTime? chossendate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chossendate == null) return;
    currentDate = chossendate;
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
  updateTask(Task task){
  editTaskfromFireStore(task);
  notifyListeners();
}
  deleteTaskfromFirestore(Task task) {
    deleteTaskFromFirestore(task);
    AppData.TasksList.remove(task);
    notifyListeners();
  }
}
