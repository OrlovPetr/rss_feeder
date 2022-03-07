part of 'favorites_bloc.dart';

/// [FavoritesEvent]
abstract class FavoritesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// [FavoritesRefresh]
class FavoritesRefresh extends FavoritesEvent {}

/// [FavoritesAdd]
class FavoritesAdd extends FavoritesEvent {
  /// [RSSFeedItem] item to add
  final RSSFeedItem item;

  /// Default [FavoritesAdd] constructor
  FavoritesAdd({
    required this.item,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        item,
      ];
}

/// [FavoritesRemove]
class FavoritesRemove extends FavoritesEvent {
  /// [RSSFeedItem] item to remove
  final RSSFeedItem item;

  /// Default [FavoritesRemove] constructor
  FavoritesRemove({
    required this.item,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        item,
      ];
}

/// [FavoritesClear]
class FavoritesClear extends FavoritesEvent {}
