part of 'exceptions.dart';

/// Application network exception
class NetworkException extends AppException {
  /// Application [Dio] instance error instance
  final DioError dioError;

  /// Default [NetworkException] constructor
  NetworkException({
    required String name,
    required this.dioError,
  }) : super(
          title: _title(dioError.response?.statusCode),
          message: _message(dioError.response?.statusCode),
          stackTrace: dioError.stackTrace,
          name: name,
          dateTime: DateTime.now(),
        );

  static String _title(int? statusCode) {
    switch (statusCode) {
      case 400:
        return ExceptionTitle.t400;
      case 404:
        return ExceptionTitle.t404;
      case 410:
        return ExceptionTitle.t410;
      case 500:
        return ExceptionTitle.t500;
      case 503:
        return ExceptionTitle.t503;
      default:
        return ExceptionTitle.tUnknown;
    }
  }

  static String _message(int? statusCode) {
    switch (statusCode) {
      case 400:
        return ExceptionMessage.m400;
      case 404:
        return ExceptionMessage.m404;
      case 410:
        return ExceptionMessage.m410;
      case 500:
        return ExceptionMessage.m500;
      case 503:
        return ExceptionMessage.m503;
      default:
        return ExceptionMessage.mUnknown;
    }
  }
}
