part of 'exceptions.dart';

/// Application system exception entity
class SystemException extends AppException {
  /// Default [AppException] constructor
  SystemException({
    required String title,
    required String message,
    StackTrace? stackTrace,
    required String name,
  }) : super(
          title: title,
          message: message,
          stackTrace: stackTrace,
          name: name,
          dateTime: DateTime.now(),
        );
}
