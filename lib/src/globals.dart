// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart';

export 'globals/content.dart';
export 'globals/enums.dart';

class Globals {
  static Map<String, dynamic>? localization;

  static Future<void> initGlobal() async {
    localization = await getLangData();
    return;
  }

  // LOCALIZATION
  static Future<Map<String, dynamic>> getLangData() async {
    String data = await rootBundle.loadString('assets/json/core.json');
    return json.decode(data);
  }
}
