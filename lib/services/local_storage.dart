import 'dart:convert';

import 'package:rss_feeder/core/exceptions/exceptions.dart';
import 'package:rss_feeder/core/logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Application local data storage service
class AppLocalStorageService {
  /// [ConsoleLogger] instance
  final AppLogger logger;

  late SharedPreferences? _prefs;

  /// Default [AppLocalStorageService] constructor
  AppLocalStorageService({
    required this.logger,
  });

  /// Initialize [SharedPreferences] instance in [AppLocalStorageService] service
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
      throw SystemException(
        title: 'Ошибка локального хранилища',
        message: 'Не удалось сохранить данные в локальном хранилище',
        name: name,
        stackTrace: s,
      );
    }
  }

  /// Get application data and transform from JSON [String] format
  Future<dynamic> getData(String key) async {
    try {
      final String? data = _prefs?.getString(key);
      return (data?.isNotEmpty ?? false) ? jsonDecode(data!) : null;
    } catch (e, s) {
      const String name = 'AppLocalStorage.getData';
      logger.s(message: e.toString(), name: name, stackTrace: s);
      throw SystemException(
        title: 'Ошибка локального хранилища',
        message: 'Не удалось получить данные из локального хранилища',
        name: name,
        stackTrace: s,
      );
    }
  }

  /// Clear application data by [String] key in local storage
  Future<void> clearData(String key) async {
    try {
      await _prefs?.remove(key);
    } catch (e, s) {
      const String name = 'AppLocalStorage.clearData';
      logger.s(message: e.toString(), name: name, stackTrace: s);
      throw SystemException(
        title: 'Ошибка локального хранилища',
        message: 'Не удалось удалить данные из локального хранилища',
        name: name,
        stackTrace: s,
      );
    }
  }
}
