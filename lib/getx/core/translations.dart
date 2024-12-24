import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppTranslations extends Translations {
  static Map<String, Map<String, String>> translations = {};

  static Future<void> init() async {
    translations['en'] = await _loadJson('en.json');
    // translations['hu'] = await _loadJson('hu.json');
    // translations['gu'] = await _loadJson('gu.json');
  }

  static Future<Map<String, String>> _loadJson(String path) async {
    final jsonString = await rootBundle.loadString('assets/lang/$path');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    return jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}
