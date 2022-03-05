import 'package:rss_feeder/core/models/config.dart';
import 'package:rss_feeder/features/home/models/feed_theme.dart';

/// Application environment type
enum AppEnvironment {
  /// Environment for release
  release,

  /// Environment for stage
  stage,

  /// Environment for development
  development,
}

/// Extension with initialize application config method
extension AppEnvironmentConfig on AppEnvironment {
  /// Return application config entity using current [AppEnvironment]
  Config get config {
    switch (this) {
      case AppEnvironment.release:
      case AppEnvironment.stage:
      case AppEnvironment.development:
      default:
        return Config(
          baseUrl: 'https://ru.investing.com/rss/',
          feeds: _feeds,
        );
    }
  }
}

List<AppFeedCategory> _feeds = [
  AppFeedCategory(name: 'Обзор рынка', themes: _market),
];

List<AppFeedTheme> _market = [
  AppFeedTheme(name: 'Главное', uri: 'market_overview.rss'),
  AppFeedTheme(name: 'Технический анализ', uri: 'market_overview.rss'),
  AppFeedTheme(name: 'Фундаментальный анализ', uri: 'market_overview.rss'),
  AppFeedTheme(name: 'Главное', uri: 'market_overview.rss'),
  AppFeedTheme(name: 'Главное', uri: 'market_overview.rss'),
];
