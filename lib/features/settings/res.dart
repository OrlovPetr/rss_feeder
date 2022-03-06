part of 'screens/settings_screen.dart';

/// [SettingsScreen] texts
class SettingsScreenStrings {
  /// [SettingsScreen] app bar title
  static const String appBarTitle = 'Настройки';

  /// [SettingsScreen] app theme button title
  static const String appThemeTitle = 'Тема приложения';

  /// [SettingsScreen] app feed refresh duration title
  static const String appFeedRefreshDurationTitle =
      'Частота обновления ленты, минут';

  /// [SettingsScreen] app reset settings title
  static const String appResetSettingsTitle = 'Сбросить настройки';

  /// [SettingsScreen] app reset feed title
  static const String appResetFeedTitle = 'Очистить избранное';
}

/// [SettingsScreen] resources
class SettingsResources {
  /// [SettingsScreen] feeds refresh duration options
  static const List<int> refreshDurationOptions = [300, 600, 1200, 2400];
}
