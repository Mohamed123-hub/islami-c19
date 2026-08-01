import 'package:flutter/cupertino.dart';

import '../utils/shared_pref.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecent = [];

  Future<void> loadMostRecent() async {
    mostRecent = await SharedPref.getMostRecentlyList();
    notifyListeners();
  }

// data
// method
}