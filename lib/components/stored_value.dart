import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  DataStorage(this.KEY_MY_VARIABLE);
  String KEY_MY_VARIABLE;

  Future<bool> setMyVariable(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY_MY_VARIABLE, value);
  }

  Future<String> getMyVariable() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_MY_VARIABLE) ?? "00:00:000";
  }
}

// class StoredValue{

//   static void _loadSelectedPage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState() {
//       _selectedPage = prefs.getString("Tiles1")!;
//     }
//   }

//   static void _saveSelecteedPage(String curr) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String prev = prefs.getString("Tiles1")!;
//     if (_selectedPage == null) {
//       prefs.setString("Tiles1", curr);
//       setState() {
//         _selectedPage = curr;
//       }
//     } else {
//       if (curr.compareTo(prev) == -1) {
//         _selectedPage = curr;
//         prefs.setString("Tiles1", curr);
//       }else{
//         _selectedPage = prev;
//       }
//     }
//   }
// }