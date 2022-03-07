part of 'favorites_bloc.dart';

/// [FavoritesState]
class FavoritesState extends Equatable {
  /// [FavoritesState load state
  final LoadState loadState;

  /// Favorites RSS feeds
  final List<RSSFeedItem> favorites;

  /// Default [FavoritesState] constructor
  const FavoritesState({
    required this.loadState,
    required this.favorites,
  });

  /// Copy with
  FavoritesState copyWith({
    LoadState? loadState,
    List<RSSFeedItem>? favorites,
  }) {
    return FavoritesState(
      loadState: loadState ?? this.loadState,
      favorites: favorites ?? this.favorites,
    );
  }

  /// Check and return if chosen item has in favorites
  bool inFavorites(RSSFeedItem item) => favorites.any(
        (RSSFeedItem favorite) =>
            favorite.title == item.title &&
            favorite.url == item.url &&
            favorite.author == item.author,
      );

  @override
  List<Object?> get props => [
        loadState,
        favorites,
      ];

  @override
  String toString() =>
      'FavoritesState ($hashCode): {loadState: $loadState | favorites: $favorites}';
}
