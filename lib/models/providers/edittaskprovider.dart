import 'package:flutter/material.dart';

import '../data/task.dart';

class EditTaskProvider extends ChangeNotifier {

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
  void refresh(){

    titleController.clear();
    discrpController.clear();
    selectedDate=DateTime.now();
    notifyListeners();
  }
}