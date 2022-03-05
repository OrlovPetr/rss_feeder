part of 'feeds_bloc.dart';

/// [FeedsEvent]
abstract class FeedsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// [FilterFeeds]
class FilterFeeds extends FeedsEvent {
  /// Search phrase for filter feeds
  final String searchPhrase;

  /// Feed categories for filter
  final List<int> categoryIds;

  /// Default [FilterFeeds] constructor
  FilterFeeds({
    required this.searchPhrase,
    required this.categoryIds,
  });
}

/// [ClearFilterFeeds]
class ClearFilterFeeds extends FeedsEvent {}
