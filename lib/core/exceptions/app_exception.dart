part of 'exceptions.dart';

/// Application default exception
abstract class AppException implements Exception {
  /// Application exception title
  final String title;

  /// Application exception message
  final String message;

  /// Application exception stackTrace
  final StackTrace? stackTrace;

  /// Application exception name
  final String name;

  /// Application exception dateTime
  final DateTime dateTime;

  /// Default [AppException] constructor
  AppException({
    required this.title,
    required this.message,
    this.stackTrace,
    required this.name,
    required this.dateTime,
  });
}
