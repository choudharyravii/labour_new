import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CommonSharedPreference {
  //Save particular key value to sp
  static setPreferences(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  //get particular key value to sp
  static Future<dynamic> getPreferences(String key) async {
    var prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString(key).toString();
    return stringValue;
  }

  //Remove particular key value form sp
  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  //Clear all the keys data from sp
  static Future<bool> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  //read key value to sp
  static read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key).toString());
  }

  //save key value to sp
  static save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static setBoolValues(String key, bool value) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool(key, value);
  }

  static getBoolValues(String key) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool(key);
  }
}