part of 'catcher.dart';

///Report Mode for [Catcher] with [PopupNotificationRoute]
class FlashReportMode extends ReportMode {
  /// Default [FlashReportMode] constructor
  FlashReportMode();

  @override
  void requestAction(Report report, BuildContext? context) async {
    await Future<void>.delayed(Duration.zero);
    super.onActionConfirmed(report);

    if (context != null) {
      final AppException exception = _extractException(report);
      await showFlash(
        context: context,
        duration: const Duration(seconds: 3),
        builder: (context, controller) {
          final flashBarTheme = FlashTheme.bar(context);
          return Flash(
            backgroundColor: Colors.redAccent,
            enableVerticalDrag: flashBarTheme.enableVerticalDrag ?? true,
            margin: flashBarTheme.margin ?? const EdgeInsets.all(16),
            borderRadius: flashBarTheme.borderRadius,
            horizontalDismissDirection:
                flashBarTheme.horizontalDismissDirection,
            brightness: flashBarTheme.brightness ?? Brightness.light,
            behavior: flashBarTheme.behavior,
            position: flashBarTheme.position,
            controller: controller,
            child: FlashBar(
              title: Text(
                exception.title,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              content: Text(
                exception.message,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  List<PlatformType> getSupportedPlatforms() =>
      [PlatformType.android, PlatformType.iOS];

  @override
  bool isContextRequired() => true;

  AppException _extractException(Report report) {
    if (report.error is Exception && report.error is AppException) {
      return report.error;
    }

    return SystemException(
      name: 'Main application error level',
      title: 'Непредвиденная ошибка',
      message: 'Произошла неизвестная ошибка.',
      stackTrace: report.stackTrace is StackTrace ? report.stackTrace : null,
    );
  }
}
