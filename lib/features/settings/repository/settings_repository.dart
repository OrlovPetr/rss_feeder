import 'package:rss_feeder/core/exceptions/exceptions.dart';
import 'package:rss_feeder/features/settings/models/settings.dart';
import 'package:rss_feeder/features/settings/screens/settings_screen.dart';
import 'package:rss_feeder/services/local_storage.dart';

/// Application [SettingsRepository] for [AppSettings]
class SettingsRepository {
  final AppLocalStorageService _appLocalStorageService;

  static const String _localStorageKey = 'app-settings-local-storage-key';

  /// [AppSettings] default refresh RSS feeds duration in seconds
  static int defaultDuration = SettingsResources.refreshDurationOptions.first;

  /// Default [SettingsRepository] constructor
  const SettingsRepository({
    required AppLocalStorageService appLocalStorageService,
  }) : _appLocalStorageService = appLocalStorageService;

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
      throw SystemException(
        title: 'Ошибка получения данных',
        message: 'Не удалось получить данные о настройках приложения',
        name: 'SettingsRepository.get',
        stackTrace: s,
      );
    }
  }

  /// Save [AppSettings] to device local storage
  Future<void> save(AppSettings appSettings) async {
    try {
      await _appLocalStorageService.setData(
          _localStorageKey, appSettings.toJson());
    } catch (e, s) {
      throw SystemException(
        title: 'Ошибка обновления данных',
        message: 'Не удалось обновить данные о настройках приложения',
        name: 'SettingsRepository.save',
        stackTrace: s,
      );
    }
  }

  /// Reset [AppSettings] in device local storage
  Future<void> reset() async {
    try {
      await _appLocalStorageService.clearData(_localStorageKey);
    } catch (e, s) {
      throw SystemException(
        title: 'Ошибка очистки данных',
        message: 'Не удалось очистить данные о настройках приложения',
        name: 'SettingsRepository.reset',
        stackTrace: s,
      );
    }
  }
}
