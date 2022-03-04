import 'dart:convert';

import 'package:rss_feeder/core/logger/app_logger.dart';
import 'package:rss_feeder/core/logger/console_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Application local data storage service
class AppLocalStorage {
  /// [ConsoleLogger] instance
  final AppLogger logger;

  late SharedPreferences? _prefs;

  /// Default [AppLocalStorage] constructor
  AppLocalStorage({
    required this.logger,
  });

  /// Initialize [SharedPreferences] instance in [AppLocalStorage] service
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Set application data in JSON format to app local data storage
  Future<void> setData(String key, dynamic data) async {
    try {
      final String jsonData = jsonEncode(data);
      await _prefs?.setString(key, jsonData);
    } catch (e, s) {
      const String name = 'AppLocalStorage.setData';
      logger.s(message: e.toString(), name: name, stackTrace: s);
      rethrow;
    }
  }

  /// Get application data and transform from JSON [String] format
  Future<dynamic> getData(String key) {
    try {
      final String data = _prefs?.getString(key) ?? '';
      return jsonDecode(data);
    } catch (e, s) {
      const String name = 'AppLocalStorage.getData';
      logger.s(message: e.toString(), name: name, stackTrace: s);
      rethrow;
    }
  }
}
