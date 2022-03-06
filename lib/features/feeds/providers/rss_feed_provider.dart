import 'package:dio/dio.dart';
import 'package:rss_feeder/services/network.dart';

/// [RSSFeedProvider]
class RSSFeedProvider {
  final AppNetworkService _appNetworkService;

  /// Default [RSSFeedProvider] constructor
  RSSFeedProvider({
    required AppNetworkService appNetworkService,
  }) : _appNetworkService = appNetworkService;

  /// Get RSS feed in xml format
  Future<dynamic> getRSSFeed(String uri) async {
    final Response<dynamic> response = await _appNetworkService.get(
      uri,
      sourceName: 'RSSFeedProvider.getRSSFeed',
    );

    return response.data;
  }
}
