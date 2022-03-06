part of 'rss_feed_bloc.dart';

/// [RSSFeedState]
class RSSFeedState extends Equatable {
  /// [RSSFeedState] load state
  final LoadState loadState;

  /// [List] of [RSSFeedItem] with news instances
  final AppRSS? appRss;

  /// Default [RSSFeedState] constructor
  const RSSFeedState({
    required this.loadState,
    this.appRss,
  });

  /// Copy With
  RSSFeedState copyWith({
    LoadState? loadState,
    AppRSS? appRss,
  }) {
    return RSSFeedState(
      loadState: loadState ?? this.loadState,
      appRss: appRss ?? this.appRss,
    );
  }

  @override
  List<Object?> get props => [
        loadState,
        appRss,
      ];

  @override
  String toString() {
    return 'RSSFeedState ($hashCode): {loadState: $loadState | appRss: $appRss}';
  }
}
