import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static String collectionKey = "recite_collection_name";
  final String collectionName;

  AppSettings({@required this.collectionName});

  static Future<AppSettings> readAppSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final collectionName = prefs.getString(collectionKey);
    return AppSettings(collectionName: collectionName);
  }

  static Future<void> saveAppSettings(String collectionName) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(collectionKey, collectionName);
  }

  static Future<void> removeAppSettings() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(collectionKey);
  }
}
