part of 'rss_feed_bloc.dart';

/// [RSSFeedEvent]
abstract class RSSFeedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// [GetRSSFeed]
class GetRSSFeed extends RSSFeedEvent {
  /// RSS feed uri
  final String? uri;

  /// Default [GetRSSFeed] constructor
  GetRSSFeed({
    required this.uri,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        uri,
      ];
}
