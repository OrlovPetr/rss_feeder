import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/features/feeds/models/feed.dart';
import 'package:rss_feeder/features/feeds/repositories/feed_repository.dart';

part 'feeds_event.dart';
part 'feeds_state.dart';

/// [FeedsBloc]
class FeedsBloc extends Bloc<FeedsEvent, FeedsState> {
  final FeedRepository _feedRepository;

  /// Default [FeedsBloc] constructor
  FeedsBloc({
    required FeedRepository feedRepository,
    required List<AppFeedCategory> fullCategoriesList,
    required List<AppFeedTheme> fullFeedsList,
  })  : _feedRepository = feedRepository,
        super(
          FeedsState(
            loadState: LoadState.initial,
            fullCategoriesList: fullCategoriesList,
            fullFeedsList: fullFeedsList,
            filteredCategoriesList: fullCategoriesList,
            filteredFeedsList: fullFeedsList,
            searchPhrase: '',
            categoryIds: fullCategoriesList
                .map<int>((AppFeedCategory cat) => cat.id)
                .toList(),
          ),
        );

  @override
  Stream<FeedsState> mapEventToState(FeedsEvent event) async* {
    if (event is FilterFeeds) {
      yield* _filterFeedsToState(event);
    } else if (event is ClearFilterFeeds) {
      yield* _clearFilterFeedsToState(event);
    }
  }

  Stream<FeedsState> _filterFeedsToState(FilterFeeds event) async* {
    try {
      yield state.copyWith(loadState: LoadState.loading);

      final List<AppFeedCategory> filteredCategoriesList =
          _feedRepository.filterFeedCategoriesList(
        state.fullCategoriesList,
        event.categoryIds,
      );
      final List<AppFeedTheme> filteredFeedsList =
          _feedRepository.filterFeedsList(
        state.fullFeedsList,
        event.searchPhrase,
        event.categoryIds,
      );

      yield state.copyWith(
        filteredCategoriesList: filteredCategoriesList,
        filteredFeedsList: filteredFeedsList,
        searchPhrase: event.searchPhrase,
        categoryIds: event.categoryIds,
      );
    } catch (e) {
      yield state.copyWith(loadState: LoadState.failure);
      rethrow;
    }
  }

  Stream<FeedsState> _clearFilterFeedsToState(ClearFilterFeeds event) async* {
    try {
      yield state.copyWith(loadState: LoadState.loading);

      yield state.copyWith(
        loadState: LoadState.success,
        filteredCategoriesList: state.fullCategoriesList,
        filteredFeedsList: state.fullFeedsList,
        searchPhrase: '',
        categoryIds: [],
      );
    } catch (e) {
      yield state.copyWith(loadState: LoadState.failure);
      rethrow;
    }
  }
}
