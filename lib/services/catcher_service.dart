import 'package:catcher/model/catcher_options.dart';
import 'package:rss_feeder/core/catcher/catcher.dart';
import 'package:rss_feeder/core/logger/logger.dart';

/// Application [Catcher] service
class CatcherService {
  /// Application [Catcher] options getter
  static CatcherOptions options(AppLogger appLogger) => CatcherOptions(
        FlashReportMode(),
        [AppLoggerHandler(appLogger: appLogger)],
        reportOccurrenceTimeout: 100,
      );
}
