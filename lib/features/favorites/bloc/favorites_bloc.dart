import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/features/feeds/models/rss_feed_item.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

/// [FavoritesBloc]
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  /// Default [FavoritesBloc] constructor
  FavoritesBloc({
    required List<RSSFeedItem> favorites,
  }) : super(
          FavoritesState(
            loadState: LoadState.initial,
            favorites: favorites,
          ),
        );
}
