import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/features/favorites/repositories/favorites_repository.dart';
import 'package:rss_feeder/features/feeds/models/rss_feed_item.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

/// [FavoritesBloc]
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository _favoritesRepository;

  /// Default [FavoritesBloc] constructor
  FavoritesBloc({
    required List<RSSFeedItem> favorites,
    required FavoritesRepository favoritesRepository,
  })  : _favoritesRepository = favoritesRepository,
        super(
          FavoritesState(
            loadState: LoadState.initial,
            favorites: favorites,
          ),
        );

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is FavoritesAdd) {
      yield* _favoritesAddToState(event);
    } else if (event is FavoritesRemove) {
      yield* _favoritesRemoveToState(event);
    } else if (event is FavoritesClear) {
      yield* _favoritesClearToState(event);
    } else if (event is FavoritesRefresh) {
      yield* _favoritesRefreshToState(event);
    }
  }

  Stream<FavoritesState> _favoritesAddToState(
    FavoritesAdd event,
  ) async* {
    try {
      yield state.copyWith(loadState: LoadState.loading);

      final List<RSSFeedItem> favorites = await _favoritesRepository.add(
        favorites: state.favorites,
        item: event.item,
      );

      yield state.copyWith(
        loadState: LoadState.success,
        favorites: favorites,
      );
    } catch (e) {
      yield state.copyWith(loadState: LoadState.failure);
    }
  }

  Stream<FavoritesState> _favoritesRemoveToState(
    FavoritesRemove event,
  ) async* {
    try {
      yield state.copyWith(loadState: LoadState.loading);

      final List<RSSFeedItem> favorites = await _favoritesRepository.remove(
        favorites: state.favorites,
        item: event.item,
      );

      yield state.copyWith(
        loadState: LoadState.success,
        favorites: favorites,
      );
    } catch (e) {
      yield state.copyWith(loadState: LoadState.failure);
    }
  }

  Stream<FavoritesState> _favoritesClearToState(
    FavoritesClear event,
  ) async* {
    try {
      yield state.copyWith(loadState: LoadState.loading);

      await _favoritesRepository.clear();

      yield state.copyWith(
        loadState: LoadState.success,
        favorites: [],
      );
    } catch (e) {
      yield state.copyWith(loadState: LoadState.failure);
    }
  }

  Stream<FavoritesState> _favoritesRefreshToState(
    FavoritesRefresh event,
  ) async* {
    try {
      yield state.copyWith(loadState: LoadState.loading);

      final List<RSSFeedItem> favorites = await _favoritesRepository.init();

      yield state.copyWith(
        loadState: LoadState.success,
        favorites: favorites,
      );
    } catch (e) {
      yield state.copyWith(loadState: LoadState.failure);
    }
  }
}
