import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier {

  int count = 0;


  void increment() {
    count++;
    notifyListeners();
  }


  void reset() {
    count = 0;
    notifyListeners();
  }

}