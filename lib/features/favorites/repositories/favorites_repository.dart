import 'package:rss_feeder/core/exceptions/exceptions.dart';
import 'package:rss_feeder/features/feeds/models/rss_feed_item.dart';
import 'package:rss_feeder/services/local_storage.dart';

/// [FavoritesRepository]
class FavoritesRepository {
  final AppLocalStorageService _appLocalStorageService;

  static const String _localStorageKey = 'app-favorites-local-storage-key';

  /// Default [FavoritesRepository] constructor
  FavoritesRepository({
    required AppLocalStorageService appLocalStorageService,
  }) : _appLocalStorageService = appLocalStorageService;

  /// Initialize favorites data
  Future<List<RSSFeedItem>> init() async {
    try {
      return _getFromLocalStorage();
    } catch (e, s) {
      throw SystemException(
        title: 'Ошибка получения данных',
        message: 'Не удалось получить данные о избранных статьях',
        name: 'FavoritesRepository.init',
        stackTrace: s,
      );
    }
  }

  /// Add new favorite
  Future<List<RSSFeedItem>> add({
    required List<RSSFeedItem> favorites,
    required RSSFeedItem item,
  }) async {
    try {
      final List<RSSFeedItem> newFavorites = [
        ...favorites,
        item,
      ];
      await _saveToLocalStorage(newFavorites);
      return newFavorites;
    } catch (e, s) {
      throw SystemException(
        title: 'Ошибка обновления данных',
        message: 'Не удалось добавить и обновить данные о избранных статьях',
        name: 'FavoritesRepository.add',
        stackTrace: s,
      );
    }
  }

  /// Remove favorite from list
  Future<List<RSSFeedItem>> remove({
    required List<RSSFeedItem> favorites,
    required RSSFeedItem item,
  }) async {
    try {
      final List<RSSFeedItem> newFavorites = favorites
          .where(
            (RSSFeedItem feed) =>
                feed.title != item.title &&
                feed.url != item.url &&
                feed.author != item.author,
          )
          .toList();
      await _saveToLocalStorage(newFavorites);
      return newFavorites;
    } catch (e, s) {
      throw SystemException(
        title: 'Ошибка обновления данных',
        message: 'Не удалось удалить и обновить данные о избранных статьях',
        name: 'FavoritesRepository.remove',
        stackTrace: s,
      );
    }
  }

  /// Clear favorites data from local storage
  Future<void> clear() async {
    try {
      await _appLocalStorageService.clearData(_localStorageKey);
    } catch (e, s) {
      throw SystemException(
        title: 'Ошибка очистки данных',
        message: 'Не удалось удалить данные о избранных статьях',
        name: 'FavoritesRepository.clear',
        stackTrace: s,
      );
    }
  }

  Future<void> _saveToLocalStorage(List<RSSFeedItem> favorites) async {
    try {
      await _appLocalStorageService.clearData(_localStorageKey);
      await _appLocalStorageService.setData(_localStorageKey, favorites);
    } catch (e, s) {
      throw SystemException(
        title: 'Ошибка сохранения данных',
        message: 'Не удалось сохранить данные о избранных статьях',
        name: 'FavoritesRepository.save',
        stackTrace: s,
      );
    }
  }

  Future<List<RSSFeedItem>> _getFromLocalStorage() async {
    final dynamic rawData =
        await _appLocalStorageService.getData(_localStorageKey);

    if (rawData != null && rawData is List) {
      return rawData
          .map<RSSFeedItem?>(
            (dynamic e) =>
                e is Map<String, dynamic> ? RSSFeedItem.fromJson(e) : null,
          )
          .cast<RSSFeedItem>()
          .toList();
    }

    return [];
  }
}
