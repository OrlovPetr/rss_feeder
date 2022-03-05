import 'package:rss_feeder/features/home/models/feed_theme.dart';

/// Application config
class Config {
  /// Application API base url
  final String baseUrl;

  /// RSS Feed items
  final List<AppFeedTheme> feeds;

  /// RSS Feed categories
  final List<AppFeedCategory> feedCategories;

  /// Default [Config] constructor
  Config({
    required this.baseUrl,
    required this.feeds,
    required this.feedCategories,
  });
}
