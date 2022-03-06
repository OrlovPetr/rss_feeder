import 'package:rss_feeder/core/enums/environment.dart';
import 'package:rss_feeder/core/logger/local_storage_logger.dart';
import 'package:rss_feeder/core/logger/logger.dart';
import 'package:rss_feeder/core/models/config.dart';
import 'package:rss_feeder/features/feeds/repositories/feed_repository.dart';
import 'package:rss_feeder/features/settings/repository/settings_repository.dart';
import 'package:rss_feeder/services/local_storage.dart';
import 'package:rss_feeder/services/network.dart';

/// Application main container
class AppContainer {
  /// Application [AppEnvironment] entity
  final AppEnvironment environment;

  /// Application [Config] entity
  final Config config;

  /// Application [AppLogger] entity
  final AppLogger appLogger;

  /// Application [AppNetworkService] entity
  final AppNetworkService networkService;

  /// Application [AppLocalStorageService] entity
  final AppLocalStorageService localStorageService;

  /// Application [SettingsRepository] entity
  final SettingsRepository settingsRepository;

  /// Application [FeedRepository] entity
  final FeedRepository feedRepository;

  /// Default [AppContainer] container
  AppContainer({
    required this.environment,
    required this.config,
    required this.appLogger,
    required this.networkService,
    required this.localStorageService,
    required this.settingsRepository,
    required this.feedRepository,
  });

  /// Initialize application [AppContainer] entity
  static Future<AppContainer> init({
    required AppEnvironment environment,
  }) async {
    final Config config = environment.config;
    final ConsoleLogger consoleLogger = ConsoleLogger();
    final LocalStorageLogger localStorageLogger = LocalStorageLogger();
    final AppLogger appLogger = AppLogger(
      consoleLogger: consoleLogger,
      localStorageLogger: localStorageLogger,
    );

    // Services initialize
    final AppNetworkService networkService =
        AppNetworkService(baseRSSUrl: config.baseUrl);
    final AppLocalStorageService appLocalStorageService =
        AppLocalStorageService();

    await appLocalStorageService.init();

    // Repositories initialize
    final SettingsRepository settingsRepository =
        SettingsRepository(appLocalStorageService: appLocalStorageService);
    const FeedRepository feedRepository = FeedRepository();

    return AppContainer(
      environment: environment,
      config: config,
      appLogger: appLogger,
      networkService: networkService,
      localStorageService: appLocalStorageService,
      settingsRepository: settingsRepository,
      feedRepository: feedRepository,
    );
  }
}
