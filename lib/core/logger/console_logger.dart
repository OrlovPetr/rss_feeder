import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

/// Application console logger for debug mode
class ConsoleLogger {
  /// Log message to console
  void log({
    required String message,
    required String name,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      final DateTime now = DateTime.now();
      dev.log(message, name: name, stackTrace: stackTrace, time: now);
    }
  }
}
