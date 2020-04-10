
import 'package:shared_preferences/shared_preferences.dart';

class LGSharedPrefernces{
  static final String _serverPrefs = "serverPref";
 static final String _someOtherPrefs = "someOtherPrefs";

  static read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  /// ------------------------------------------------------------
  /// Method that returns the user decision on server
  /// ------------------------------------------------------------
  static Future<String> getServerPrefs(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  /// ----------------------------------------------------------
  /// Method that saves the user decision on server
  /// ----------------------------------------------------------
  static Future<bool> setServerPrefs(String key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }
}