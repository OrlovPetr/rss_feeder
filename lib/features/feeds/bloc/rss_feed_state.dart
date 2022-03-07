part of 'rss_feed_bloc.dart';

/// [RSSFeedState]
class RSSFeedState extends Equatable {
  /// [RSSFeedState] load state
  final LoadState loadState;

  /// [List] of [RSSFeedItem] with news instances
  final AppRSS? appRss;

  /// base URI of RSS feed
  final String? uri;

  /// Refresh duration time in minutes
  final int refreshDuration;

  /// Default [RSSFeedState] constructor
  const RSSFeedState({
    required this.loadState,
    this.appRss,
    this.uri,
    required this.refreshDuration,
  });

  /// Copy With
  RSSFeedState copyWith({
    LoadState? loadState,
    AppRSS? appRss,
    String? uri,
    int? refreshDuration,
  }) {
    return RSSFeedState(
      loadState: loadState ?? this.loadState,
      appRss: appRss ?? this.appRss,
      uri: (uri?.isNotEmpty ?? false) ? uri : this.uri,
      refreshDuration: refreshDuration ?? this.refreshDuration,
    );
  }

  @override
  List<Object?> get props => [
        loadState,
        appRss,
        uri,
        refreshDuration,
      ];

  @override
  String toString() {
    return 'RSSFeedState ($hashCode): {loadState: $loadState | appRss: $appRss | uri: $uri | refreshDuration: $refreshDuration}';
  }
}
