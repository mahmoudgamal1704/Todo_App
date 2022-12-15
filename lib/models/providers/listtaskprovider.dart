import 'package:flutter/material.dart';
import 'package:todoapp/models/data/appdata.dart';

import '../../shared/network/local/firebase_utls.dart';
import '../data/task.dart';

class ListTaskProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var discrpController = TextEditingController();

  void SelectDate(BuildContext context) async {
    DateTime? chossendate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chossendate == null) return;
    selectedDate = chossendate;
    notifyListeners();
  }
  void getData (Task task ){
    titleController.text=task.title;
    discrpController.text=task.description;
    selectedDate=DateTime.fromMicrosecondsSinceEpoch(task.date);
    notifyListeners();
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
