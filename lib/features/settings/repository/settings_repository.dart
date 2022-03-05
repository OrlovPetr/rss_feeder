import 'package:rss_feeder/core/exceptions/exceptions.dart';
import 'package:rss_feeder/core/logger/logger.dart';
import 'package:rss_feeder/features/settings/models/settings.dart';
import 'package:rss_feeder/services/local_storage.dart';

/// Application [SettingsRepository] for [AppSettings]
class SettingsRepository {
  final AppLocalStorageService _appLocalStorageService;

  final AppLogger _appLogger;

  static const String _localStorageKey = 'app-settings-local-storage-key';

  /// [AppSettings] default refresh RSS feeds duration in seconds
  static const int defaultDuration = 30;

  /// Default [SettingsRepository] constructor
  const SettingsRepository({
    required AppLocalStorageService appLocalStorageService,
    required AppLogger appLogger,
  })  : _appLocalStorageService = appLocalStorageService,
        _appLogger = appLogger;

  /// Get [AppSettings] from device local storage
  Future<AppSettings> get() async {
    try {
      final dynamic rawData =
          await _appLocalStorageService.getData(_localStorageKey);

      if (rawData != null && rawData is Map<String, dynamic>) {
        return AppSettings.fromJson(rawData);
      }

      return AppSettings(
        appThemeStyle: AppThemeStyle.light,
        refreshDuration: defaultDuration,
      );
    } catch (e, s) {
      const String name = 'SettingsRepository.get';
      const String title = 'Ошибка получения данных';
      const String message =
          'Не удалось получить данные о настройках приложения';
      _appLogger.s(message: e.toString(), name: name, stackTrace: s);
      throw SystemException(
        title: title,
        message: message,
        name: name,
      );
    }
  }

  /// Save [AppSettings] to device local storage
  Future<void> save(AppSettings appSettings) async {
    try {
      await _appLocalStorageService.setData(
          _localStorageKey, appSettings.toJson());
    } catch (e, s) {
      const String name = 'SettingsRepository.save';
      const String title = 'Ошибка обновления данных';
      const String message =
          'Не удалось обновить данные о настройках приложения';
      _appLogger.s(message: e.toString(), name: name, stackTrace: s);
      throw SystemException(
        title: title,
        message: message,
        name: name,
      );
    }
  }

  /// Reset [AppSettings] in device local storage
  Future<void> reset() async {
    try {
      await _appLocalStorageService.clearData(_localStorageKey);
    } catch (e, s) {
      const String name = 'SettingsRepository.reset';
      const String title = 'Ошибка очистки данных';
      const String message =
          'Не удалось очистить данные о настройках приложения';
      _appLogger.s(message: e.toString(), name: name, stackTrace: s);
      throw SystemException(
        title: title,
        message: message,
        name: name,
      );
    }
  }
}
