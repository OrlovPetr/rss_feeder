part of 'exceptions.dart';

/// Application exceptions titles
class ExceptionTitle {
  /// HTTP 400 status code error title
  static const t400 = 'Неверный запрос.';

  /// HTTP 404 status code error title
  static const t404 = 'Ресурс не найден.';

  /// HTTP 410 status code error title
  static const t410 = 'Источник отсутствует.';

  /// HTTP 500 status code error title
  static const t500 = 'Ошибка сервера';

  /// HTTP 503 status code error title
  static const t503 = 'Сервис недоступен.';

  /// HTTP another status code error title
  static const tUnknown = 'Непредвиденная ошибка.';
}

/// Application exceptions messages
class ExceptionMessage {
  /// HTTP 400 status code error message
  static const m400 =
      'Неверные данные.\nИсправьте запрос и попробуйте еще раз.';

  /// HTTP 404 status code error message
  static const m404 = 'Попробуйте еще раз немного позже.';

  /// HTTP 410 status code error message
  static const m410 =
      'Искомых данных больше нет на сервере.\nПриносим свои извинения.';

  /// HTTP 500 status code error message
  static const m500 =
      'Произошла ошибка на сервере.\nПопробуйте еще раз немного позже.';

  /// HTTP 503 status code error message
  static const m503 =
      'В настоящий момент сервер не доступен.\nПопробуйте еще раз немного позже.';

  /// HTTP another status code error message
  static const mUnknown = 'Попробуйте еще раз.';
}
