/// Application news feed category
class AppFeedCategory {
  /// [AppFeedCategory] id
  final int id;

  /// [AppFeedCategory] name
  final String name;

  /// Default [AppFeedCategory] constructor
  AppFeedCategory({
    required this.id,
    required this.name,
  });
}

/// Application news feed theme
class AppFeedTheme {
  /// [AppFeedTheme] id
  final int id;

  /// [AppFeedTheme] uri
  final String uri;

  /// [AppFeedTheme] name
  final String name;

  /// [AppFeedTheme] categories
  final List<int> categories;

  /// Default [AppFeedTheme] constructor
  AppFeedTheme({
    required this.id,
    required this.uri,
    required this.name,
    required this.categories,
  });
}
