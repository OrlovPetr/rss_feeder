/// Application news feed category
class AppFeedCategory {
  /// [AppFeedCategory] name
  final String name;

  /// [AppFeedCategory] themes
  final List<AppFeedTheme> themes;

  /// Default [AppFeedCategory] constructor
  AppFeedCategory({
    required this.name,
    required this.themes,
  });
}

/// Application news feed theme
class AppFeedTheme {
  /// [AppFeedTheme] uri
  final String uri;

  /// [AppFeedTheme] name
  final String name;

  /// Default [AppFeedTheme] constructor
  AppFeedTheme({
    required this.uri,
    required this.name,
  });
}
