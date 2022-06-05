import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  final freps = SharedPreferences.getInstance();

  remove(key) async {
    var p = await freps;
    return p.remove(key);
  }

  setstring(String key, value) async {
    var p = await freps;
    return p.setString(key, value);
  }

  setint(String key, value) async {
    var p = await freps;
    return p.setInt(key, value);
  }

  setbool(String key, value) async {
    var p = await freps;
    return p.setBool(key, value);
  }

  setdouble(String key, value) async {
    var p = await freps;
    return p.setDouble(key, value);
  }

  getstring(String key) async {
    var p = await freps;
    return p.getString(key);
  }

  getint(String key) async {
    var p = await freps;
    return p.getInt(key);
  }

  getbool(String key) async {
    var p = await freps;
    return p.getBool(key);
  }

  getdouble(String key) async {
    var p = await freps;
    return p.getDouble(key);
  }
}
