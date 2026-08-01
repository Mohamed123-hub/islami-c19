import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String mostRecentKey = "most-recent";

  static saveMostRecentlySura(int newIndex) async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance(); // SharedPref

    List<String> mostList = prefs.getStringList(mostRecentKey) ?? [];
    mostList.remove(newIndex.toString());
    mostList.insert(0, newIndex.toString());
    if (mostList.length > 5) {
      mostList = mostList.sublist(0, 5);
    }
    print(mostList);
    await prefs.setStringList(mostRecentKey, mostList);
    // prefs.setStringList(mostRecentKey, value)
  }

  static getMostRecentlyList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentAsString = prefs.getStringList(mostRecentKey) ?? [];
    List<int> mostRecentAsInt = mostRecentAsString
        .map((element) => int.parse(element))
        .toList();

    return mostRecentAsInt.toList();
  }
}