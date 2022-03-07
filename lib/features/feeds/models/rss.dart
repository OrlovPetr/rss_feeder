import 'package:rss_feeder/features/feeds/models/rss_feed_item.dart';

/// Application RSS feed parse entity
class AppRSS {
  /// RSS feed main title
  final String title;

  /// RSS feed main description
  final String description;

  /// RSS feed main link
  final String link;

  /// RSS feed items
  final List<RSSFeedItem> items;

  /// Default [AppRSS] constructor
  AppRSS({
    required this.title,
    required this.description,
    required this.link,
    required this.items,
  });

  @override
  String toString() =>
      'AppRSS ($hashCode): {title: $title | description: $description | link: $link | items: $items}';
}
