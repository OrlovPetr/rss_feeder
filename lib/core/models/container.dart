import 'package:rss_feeder/core/enums/environment.dart';
import 'package:rss_feeder/core/logger/local_storage_logger.dart';
import 'package:rss_feeder/core/logger/logger.dart';
import 'package:rss_feeder/core/models/config.dart';
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

  /// Application [AppNetwork] entity
  final AppNetwork networkService;

  /// Application [AppLocalStorage] entity
  final AppLocalStorage localStorageService;

  /// Default [AppContainer] container
  AppContainer({
    required this.environment,
    required this.config,
    required this.appLogger,
    required this.networkService,
    required this.localStorageService,
  });

  /// Initialize application [AppContainer] entity
  static AppContainer init({required AppEnvironment environment}) {
    final Config config = environment.config;
    final ConsoleLogger consoleLogger = ConsoleLogger();
    final LocalStorageLogger localStorageLogger = LocalStorageLogger();
    final AppLogger appLogger = AppLogger(
      consoleLogger: consoleLogger,
      localStorageLogger: localStorageLogger,
    );
    final AppNetwork networkService = AppNetwork(baseRSSUrl: config.baseUrl);
    final AppLocalStorage appLocalStorage = AppLocalStorage(logger: appLogger);

    return AppContainer(
      environment: environment,
      config: config,
      appLogger: appLogger,
      networkService: networkService,
      localStorageService: appLocalStorage,
    );
  }
}
