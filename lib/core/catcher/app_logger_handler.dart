part of 'catcher.dart';

/// Application level [Catcher] errors handler
class AppLoggerHandler extends ReportHandler {
  /// Application [AppLogger] instance
  final AppLogger appLogger;

  /// Default [AppLoggerHandler] constructor
  AppLoggerHandler({
    required this.appLogger,
  });

  @override
  List<PlatformType> getSupportedPlatforms() =>
      [PlatformType.android, PlatformType.iOS];

  @override
  Future<bool> handle(Report error, BuildContext? context) {
    if (error.error is Exception && error.error is SystemException) {
      final SystemException exception = error.error as SystemException;
      appLogger.s(
        message: exception.message,
        name: exception.name,
        stackTrace: exception.stackTrace,
      );
    }

    if (error.error is Exception && error.error is NetworkException) {
      final NetworkException exception = error.error as NetworkException;
      appLogger.n(name: exception.name, error: exception.dioError);
    }

    return Future.value(true);
  }
}
