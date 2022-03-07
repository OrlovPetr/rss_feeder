part of '../screens/favorites_screen.dart';

/// [FavoritesScreen] body widget
class FavoritesBody extends StatelessWidget {
  /// Favorites RSS feeds
  final FavoritesState state;

  /// Default [FavoritesBody] constructor
  const FavoritesBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.favorites.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Text(
          FavoritesScreenStrings.emptyListMessage,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: state.favorites.length,
        itemBuilder: (BuildContext context, int index) => FavoritesItem(
          item: state.favorites[index],
          length: state.favorites.length,
          index: index,
        ),
      ),
    );
  }
}
