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
          baseUrl: '',
          feeds: _feeds,
          feedCategories: _categories,
        );
    }
  }
}

List<AppFeedCategory> _categories = [
  AppFeedCategory(id: 1, name: 'Обзор рынка'),
  AppFeedCategory(id: 2, name: 'Новости'),
];

List<AppFeedTheme> _feeds = [
  ..._marketFeeds,
  ..._newsFeeds,
];

List<AppFeedTheme> _newsFeeds = [
  AppFeedTheme(
    id: 6,
    name: 'Все новости',
    uri: 'news.rss',
    categories: [2],
  ),
  AppFeedTheme(
    id: 7,
    name: 'Новости и обновления о коронавирусе',
    uri: 'news_2.rss',
    categories: [2],
  ),
  AppFeedTheme(
    id: 8,
    name: 'Новости криптовалют',
    uri: 'news_301.rss',
    categories: [2],
  ),
  AppFeedTheme(
    id: 9,
    name: 'Новости личных финансов',
    uri: 'news_350.rss',
    categories: [2],
  ),
  AppFeedTheme(
    id: 10,
    name: 'Новости валютного рынка',
    uri: 'news_1.rss',
    categories: [2],
  ),
  AppFeedTheme(
    id: 11,
    name: 'Самое популярное',
    uri: 'news_285.rss',
    categories: [2],
  ),
  AppFeedTheme(
    id: 12,
    name: 'Последние финансовые новости',
    uri: 'news_477.rss',
    categories: [2],
  ),
  AppFeedTheme(
    id: 13,
    name: 'Новости фьючерсов и сырьевых рынков',
    uri: 'news_11.rss',
    categories: [2],
  ),
  AppFeedTheme(
    id: 14,
    name: 'Новости фондовых рынков',
    uri: 'news_25.rss',
    categories: [2],
  ),
  AppFeedTheme(
    id: 15,
    name: 'Экономические показатели',
    uri: 'news_95.rss',
    categories: [2],
  ),
  AppFeedTheme(
    id: 16,
    name: 'Новости экономики',
    uri: 'news_14.rss',
    categories: [2],
  ),
];

List<AppFeedTheme> _marketFeeds = [
  AppFeedTheme(
    id: 1,
    name: 'Главное',
    uri: 'market_overview.rss',
    categories: [1],
  ),
  AppFeedTheme(
    id: 2,
    name: 'Технический анализ',
    uri: 'market_overview.rss',
    categories: [1],
  ),
  AppFeedTheme(
    id: 3,
    name: 'Фундаментальный анализ',
    uri: 'market_overview.rss',
    categories: [1],
  ),
  AppFeedTheme(
    id: 4,
    name: 'Мнения',
    uri: 'forex_Opinion.rss',
    categories: [1],
  ),
  AppFeedTheme(
    id: 5,
    name: 'Сигналы',
    uri: 'forex_Signals.rss',
    categories: [1],
  ),
];

// List<AppFeedCategory> _feeds = [
//   AppFeedCategory(name: 'Обзор рынка', themes: _market),
// ];
//
// List<AppFeedTheme> _market = [
//   AppFeedTheme(name: 'Главное', uri: 'market_overview.rss'),
//   AppFeedTheme(name: 'Технический анализ', uri: 'market_overview.rss'),
//   AppFeedTheme(name: 'Фундаментальный анализ', uri: 'market_overview.rss'),
//   AppFeedTheme(name: 'Главное', uri: 'market_overview.rss'),
//   AppFeedTheme(name: 'Главное', uri: 'market_overview.rss'),
// ];
