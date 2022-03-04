import 'package:dio/dio.dart';

/// Application network service entity.
///
/// Uses for all network requests in app
class AppNetwork {
  /// Base app RSS url
  final String baseRSSUrl;

  final Dio _dio;

  static const Map<String, dynamic> _headers = {
    'Accept': 'text/plain',
  };

  /// Default [AppNetwork] constructor
  AppNetwork({
    required this.baseRSSUrl,
  }) : _dio = Dio(BaseOptions(baseUrl: baseRSSUrl, headers: _headers));

  /// [Dio] getter for use in app
  Dio get dio => _dio;
}
