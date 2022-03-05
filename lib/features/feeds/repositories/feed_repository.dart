import 'package:rss_feeder/core/exceptions/exceptions.dart';
import 'package:rss_feeder/core/extensions/list_extension.dart';
import 'package:rss_feeder/core/logger/logger.dart';
import 'package:rss_feeder/features/feeds/models/feed.dart';

/// Application [FeedRepository] for feeds
class FeedRepository {
  final AppLogger _appLogger;

  /// Default [FeedRepository] constructor
  const FeedRepository({
    required AppLogger appLogger,
  }) : _appLogger = appLogger;

  /// Filter [AppFeedCategory] by id list
  List<AppFeedCategory> filterFeedCategoriesList(
    List<AppFeedCategory> fullCategoriesList,
    List<int> categoryIds,
  ) {
    try {
      return fullCategoriesList
          .where((AppFeedCategory category) =>
              categoryIds.isNotEmpty ? categoryIds.contains(category.id) : true)
          .toList();
    } catch (e, s) {
      const String name = 'FeedRepository.filterFeedCategoriesList';
      const String title = 'Ошибка фильтрации данных';
      const String message =
          'Не удалось отфильтровать категории потоков новостей';
      _appLogger.s(message: e.toString(), name: name, stackTrace: s);
      throw SystemException(
        title: title,
        message: message,
        name: name,
      );
    }
  }

  /// Filter [AppFeedTheme] by search phrase and chosen categories
  List<AppFeedTheme> filterFeedsList(
    List<AppFeedTheme> fullFeedsList,
    String searchPhrase,
    List<int> categoryIds,
  ) {
    try {
      return fullFeedsList
          .where((AppFeedTheme theme) => theme.name.contains(searchPhrase))
          .where((AppFeedTheme theme) => categoryIds.isNotEmpty
              ? categoryIds.containsList(theme.categories)
              : true)
          .toList();
    } catch (e, s) {
      const String name = 'FeedRepository.filterFeedsList';
      const String title = 'Ошибка фильтрации данных';
      const String message = 'Не удалось отфильтровать потоки новостей';
      _appLogger.s(message: e.toString(), name: name, stackTrace: s);
      throw SystemException(
        title: title,
        message: message,
        name: name,
      );
    }
  }
}
