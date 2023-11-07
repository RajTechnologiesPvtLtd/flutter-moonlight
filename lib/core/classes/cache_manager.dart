import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static Future<bool> checkKeyExist(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static void saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      log("Invalid Type");
    }
  }

  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<bool> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<int?> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<int?> setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await prefs.setInt(key, value)) {
      return getInt(key);
    }
    return 0;
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<bool?> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await prefs.setBool(key, value)) {
      return getBool(key);
    }
    return false;
  }

  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<String?> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    if (await prefs.setString(key, value)) {
      return getString(key);
    }
    return "";
  }
}
