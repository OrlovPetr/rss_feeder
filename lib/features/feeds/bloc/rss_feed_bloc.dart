import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/core/exceptions/exceptions.dart';
import 'package:rss_feeder/features/feeds/models/rss.dart';
import 'package:rss_feeder/features/feeds/models/rss_feed_item.dart';
import 'package:rss_feeder/features/feeds/repositories/rss_feed_repository.dart';

part 'rss_feed_event.dart';
part 'rss_feed_state.dart';

/// [RSSFeedBloc]
class RSSFeedBloc extends Bloc<RSSFeedEvent, RSSFeedState> {
  final RSSFeedRepository _rssFeedRepository;

  /// Default [RSSFeedBloc] constructor
  RSSFeedBloc({
    required RSSFeedRepository rssFeedRepository,
  })  : _rssFeedRepository = rssFeedRepository,
        super(
          const RSSFeedState(
            loadState: LoadState.initial,
          ),
        );

  @override
  Stream<RSSFeedState> mapEventToState(RSSFeedEvent event) async* {
    if (event is GetRSSFeed) {
      yield* _getRSSFeedToState(event);
    }
  }

  Stream<RSSFeedState> _getRSSFeedToState(GetRSSFeed event) async* {
    try {
      yield state.copyWith(loadState: LoadState.loading);

      if (event.uri?.isEmpty ?? false) {
        yield state.copyWith(loadState: LoadState.failure);
        throw SystemException(
          title: 'Некорректный запрос',
          message: 'Нет данных об адресе запроса RSS потока',
          name: 'RSSFeedBloc._getRSSFeedToState',
        );
      }

      final AppRSS? rss = await _rssFeedRepository.getRSSFeed(event.uri!);

      yield state.copyWith(
        loadState: LoadState.success,
        appRss: rss,
        uri: event.uri,
      );
    } catch (e) {
      yield state.copyWith(loadState: LoadState.failure);
      rethrow;
    }
  }
}
