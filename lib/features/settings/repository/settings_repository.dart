import 'package:rss_feeder/features/settings/models/settings.dart';
import 'package:rss_feeder/services/local_storage.dart';

/// Application [SettingsRepository] for [AppSettings]
class SettingsRepository {
  final AppLocalStorageService _appLocalStorageService;

  static const String _localStorageKey = 'app-settings-local-storage-key';

  /// [AppSettings] default refresh RSS feeds duration in seconds
  static const int defaultDuration = 30;

  /// Default [SettingsRepository] constructor
  const SettingsRepository({
    required AppLocalStorageService appLocalStorageService,
  }) : _appLocalStorageService = appLocalStorageService;

  /// Get [AppSettings] from device local storage
  Future<AppSettings> get() async {
    final dynamic rawData =
        await _appLocalStorageService.getData(_localStorageKey);

    if (rawData != null && rawData is Map<String, dynamic>) {
      return AppSettings.fromJson(rawData);
    }

    return AppSettings(
      appThemeStyle: AppThemeStyle.light,
      refreshDuration: defaultDuration,
    );
  }

  /// Save [AppSettings] to device local storage
  Future<void> save(AppSettings appSettings) async {
    await _appLocalStorageService.setData(
        _localStorageKey, appSettings.toJson());
  }

  /// Reset [AppSettings] in device local storage
  Future<void> reset() async {
    await _appLocalStorageService.clearData(_localStorageKey);
  }
}
