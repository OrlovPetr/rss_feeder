import 'package:dio/dio.dart';
import 'package:rss_feeder/core/exceptions/exceptions.dart';
import 'package:rss_feeder/features/feeds/models/rss.dart';
import 'package:rss_feeder/features/feeds/models/rss_feed_item.dart';
import 'package:rss_feeder/features/feeds/providers/rss_feed_provider.dart';
import 'package:webfeed/webfeed.dart';

/// [RSSFeedRepository]
class RSSFeedRepository {
  final RSSFeedProvider _rssFeedProvider;

  /// Default [RSSFeedRepository] constructor
  RSSFeedRepository({
    required RSSFeedProvider rssFeedProvider,
  }) : _rssFeedProvider = rssFeedProvider;

  /// Get RSS feed in xml format and transform it to...
  Future<AppRSS?> getRSSFeed(String uri) async {
    try {
      final dynamic response = await _rssFeedProvider.getRSSFeed(uri);

      if (response != null && response is String && response.isNotEmpty) {
        final RssFeed rssFeed = RssFeed.parse(response);
        final List<RSSFeedItem> items = rssFeed.items
                ?.map<RSSFeedItem>(
                  (RssItem e) => RSSFeedItem(
                    title: e.title,
                    author: e.author,
                    url: e.link,
                    date: e.pubDate,
                  ),
                )
                .toList() ??
            [];

        return AppRSS(
          title: rssFeed.title ?? 'Нет данных о потоке',
          description: rssFeed.description ?? 'Нет данных...',
          link: rssFeed.link ?? '',
          items: items,
        );
      }
    } catch (e, s) {
      if (e is Exception && e is DioError) {
        throw NetworkException(
          name: 'RSSFeedRepository.getRSSFeed',
          dioError: e,
        );
      } else {
        throw SystemException(
          title: 'Ошибка RSS потока',
          message: 'Системная ошибка получения RSS потока',
          name: 'RSSFeedRepository.getRSSFeed',
          stackTrace: s,
        );
      }
    }
  }
}
