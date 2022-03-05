part of 'logger.dart';

/// Application main logger instance
class AppLogger {
  final ConsoleLogger _consoleLogger;

  final LocalStorageLogger _localStorageLogger;

  /// Default [AppLogger] constructor
  const AppLogger({
    required ConsoleLogger consoleLogger,
    required LocalStorageLogger localStorageLogger,
  })  : _consoleLogger = consoleLogger,
        _localStorageLogger = localStorageLogger;

  /// Application log for system messages and errors
  void s({
    required String message,
    required String name,
    StackTrace? stackTrace,
  }) {
    final String _name = 'System Log | $name';
    _log(message: message, name: _name, stackTrace: stackTrace);
  }

  /// Application log for network messages and errors
  void n({
    required String name,
    required DioError error,
  }) {
    final String _name = 'Network Log | $name';
    final String _message = _networkErrorMessage(error);
    _log(message: _message, name: _name, stackTrace: error.stackTrace);
  }

  void _log({
    required String message,
    required String name,
    StackTrace? stackTrace,
  }) {
    _consoleLogger.log(message: message, name: name, stackTrace: stackTrace);
    _localStorageLogger.log(message: message, name: name);
  }

  String _networkErrorMessage(DioError error) {
    final StringBuffer errorMessage =
        StringBuffer('AppNetworkError: ${error.error}\n');
    errorMessage.write('Uri: ${error.requestOptions.uri}\n');
    errorMessage.write('Request data: ${error.requestOptions.data}\n');
    errorMessage.write('Response data: ${error.response?.data}\n');
    return errorMessage.toString();
  }
}
