part of 'screens/feeds_screen.dart';

/// [FeedsScreenStrings] texts
class FeedsScreenStrings {
  /// [FeedsScreen] app bar title
  static const String appBarTitle = 'Новости';
}

/// [RSSFeedScreen] strings
class RSSFeedScreenStrings {
  /// [RSSFeedScreen] empty message if not found any news RSS feed item
  static const String emptyListMessage =
      'Не найдено ни одной статьи по искомому запросу';

  /// [RSSFeedScreen] not found RSS feed data
  static const String hasNoDataAboutFeed = 'Нет данных о потоке';

  /// [RSSFeedScreen not found RSS feed data message
  static const String hasNoDataAboutFeedDescription = 'Нет данных...';

  /// [RSSFeedItemWidget] date text
  static const String rssFeedItemWidgetDate = 'Опубликовано: #TAG';

  /// [RSSFeedItemWidget] empty date text
  static const String rssFeedItemWidgetDateEmpty =
      'Нет данных о дате публикации';

  /// [RSSFeedItemWidget] author text
  static const String rssFeedItemWidgetAuthor = 'Автор: #TAG';

  /// [RSSFeedItemWidget] author more
  static const String rssFeedItemWidgetMore = 'Подробнее';
}
