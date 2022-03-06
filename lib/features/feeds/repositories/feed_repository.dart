import 'package:rss_feeder/core/exceptions/exceptions.dart';
import 'package:rss_feeder/core/extensions/list_extension.dart';
import 'package:rss_feeder/features/feeds/models/feed.dart';

/// Application [FeedRepository] for feeds
class FeedRepository {
  /// Default [FeedRepository] constructor
  const FeedRepository();

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
      throw SystemException(
        title: 'Ошибка фильтрации данных',
        message: 'Не удалось отфильтровать категории потоков новостей',
        name: 'FeedRepository.filterFeedCategoriesList',
        stackTrace: s,
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
      throw SystemException(
        title: 'Ошибка фильтрации данных',
        message: 'Не удалось отфильтровать потоки новостей',
        name: 'FeedRepository.filterFeedsList',
        stackTrace: s,
      );
    }
  }
}
