import 'package:flutter/material.dart';
import 'package:rss_feeder/features/feeds/screens/rss_feed_screen.dart';
import 'package:rss_feeder/features/home/screens/home_screen.dart';

/// Application routes list
enum Routes {
  /// Home
  home,

  /// RSS feed
  rssFeed,
}

/// Extension for [Routes] with service methods
extension RoutesExt on Routes {
  /// Return [String] path name
  String get name => toString().replaceAll('Routes.', '');
}

/// Application routes
class AppRouter {
  Map<Routes, WidgetBuilder> _routes(BuildContext context) => {
        Routes.home: (BuildContext context) => const HomeScreen(),
        Routes.rssFeed: (BuildContext context) => const RSSFeedScreen(),
      };

  /// Return [Map] with [String] key and [WidgetBuilder] value routes list
  Map<String, WidgetBuilder> routes(BuildContext context) =>
      _routes(context).map<String, WidgetBuilder>(
        (Routes key, WidgetBuilder builder) => MapEntry(key.name, builder),
      );
}
