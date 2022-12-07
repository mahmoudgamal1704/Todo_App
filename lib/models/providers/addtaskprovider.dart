import 'package:flutter/material.dart';

class AddTaskProvider extends ChangeNotifier {

   DateTime selectedDate = DateTime.now();

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
}