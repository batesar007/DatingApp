import 'package:shared_preferences/shared_preferences.dart';

class Prefrence {
  static late SharedPreferences _preferences;
  static String userkey = "user";
  static instance() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setuser(String value, String key) async {
    await _preferences.setString(key, value);
  }

  static dynamic getuser(String key) async {
    await _preferences.getString(key);
  }

  static Future<void> removeuser(String key) async {
    await _preferences.remove(key);
  }
}
