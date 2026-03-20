import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class EinBaseDio {
  Dio? _dio;

  abstract String baseUrl;

  List<Interceptor> interceptors = [];
  bool enableLoggingDebug = kDebugMode;
  bool logRequestHeader = true;
  bool logRequestBody = false;
  bool logResponseHeader = true;
  bool logResponseBody = false;
  Duration timeout = const Duration(seconds: 10);

  Dio instance() {
    if (_dio == null) {
      final url = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
      _dio = Dio(
        BaseOptions(
          baseUrl: url,
          connectTimeout: timeout,
          receiveTimeout: timeout,
          sendTimeout: timeout,
        ),
      );
      _dio?.interceptors.addAll(interceptors);
      if (enableLoggingDebug) {
        _dio?.interceptors.add(
          PrettyDioLogger(
            requestHeader: logRequestHeader,
            requestBody: logRequestBody,
            responseHeader: logResponseHeader,
            responseBody: logResponseBody,
          ),
        );
      }
    }
    return _dio!;
  }
}
