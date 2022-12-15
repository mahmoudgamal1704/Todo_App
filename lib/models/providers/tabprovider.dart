

import 'package:flutter/material.dart';

class TapsProvider extends ChangeNotifier {

  int tapindex=0;

  void ChangeIndex (int index) {
    tapindex=index;
    notifyListeners();
  }

}