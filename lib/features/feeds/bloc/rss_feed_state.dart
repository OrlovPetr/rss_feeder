part of 'rss_feed_bloc.dart';

/// [RSSFeedState]
class RSSFeedState extends Equatable {
  /// [RSSFeedState] load state
  final LoadState loadState;

  /// [List] of [RSSFeedItem] with news instances
  final AppRSS? appRss;

  /// base URI of RSS feed
  final String? uri;

  /// Default [RSSFeedState] constructor
  const RSSFeedState({
    required this.loadState,
    this.appRss,
    this.uri,
  });

  /// Copy With
  RSSFeedState copyWith({
    LoadState? loadState,
    AppRSS? appRss,
    String? uri,
  }) {
    return RSSFeedState(
      loadState: loadState ?? this.loadState,
      appRss: appRss ?? this.appRss,
      uri: (uri?.isNotEmpty ?? false) ? uri : this.uri,
    );
  }

  @override
  List<Object?> get props => [
        loadState,
        appRss,
        uri,
      ];

  @override
  String toString() {
    return 'RSSFeedState ($hashCode): {loadState: $loadState | appRss: $appRss | uri: $uri}';
  }
}
