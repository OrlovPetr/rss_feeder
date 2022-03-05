import 'package:dio/dio.dart';
import 'package:rss_feeder/core/exceptions/exceptions.dart';

/// Application network service entity.
///
/// Uses for all network requests in app
class AppNetworkService {
  /// Base app RSS url
  final String baseRSSUrl;

  final Dio _dio;

  static const Map<String, dynamic> _headers = {
    'Accept': 'text/plain',
  };

  /// Default [AppNetworkService] constructor
  AppNetworkService({
    required this.baseRSSUrl,
  }) : _dio = Dio(BaseOptions(baseUrl: baseRSSUrl, headers: _headers));

  /// Application NetworkService GET method
  Future<Response<T>> get<T>(
    String path, {
    required String sourceName,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      throw NetworkException(name: sourceName, dioError: e);
    } catch (e, s) {
      throw _systemException(sourceName, s);
    }
  }

  /// Application NetworkService POST method
  Future<Response<T>> post<T>(
    String path, {
    data,
    required String sourceName,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      throw NetworkException(name: sourceName, dioError: e);
    } catch (e, s) {
      throw _systemException(sourceName, s);
    }
  }

  /// Application NetworkService PUT method
  Future<Response<T>> put<T>(
    String path, {
    data,
    required String sourceName,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    try {
      return _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      throw NetworkException(name: sourceName, dioError: e);
    } catch (e, s) {
      throw _systemException(sourceName, s);
    }
  }

  /// Application NetworkService DELETE method
  Future<Response<T>> delete<T>(
    String path, {
    data,
    required String sourceName,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    try {
      return _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      throw NetworkException(name: sourceName, dioError: e);
    } catch (e, s) {
      throw _systemException(sourceName, s);
    }
  }

  SystemException _systemException(String name, StackTrace? stackTrace) =>
      SystemException(
        title: 'Неизвестная сетевая ошибка',
        message: 'Произошел неизвестный сбой сети.\nПопробуйте еще раз.',
        name: name,
        stackTrace: stackTrace,
      );
}
