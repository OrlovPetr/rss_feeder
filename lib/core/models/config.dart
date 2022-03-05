import 'package:rss_feeder/features/home/models/feed_theme.dart';

/// Application config
class Config {
  /// Application API base url
  final String baseUrl;

  final List<AppFeedCategory> feeds;

  /// Default [Config] constructor
  Config({
    required this.baseUrl,
    required this.feeds,
  });
}
