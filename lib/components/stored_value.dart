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
