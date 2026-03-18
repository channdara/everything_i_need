import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class EinBaseDio {
  Dio? _dio;

  abstract String baseUrl;

  List<Interceptor> interceptors = [];
  bool enableLoggingDebug = true;
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
          PrettyDioLogger(requestHeader: true, requestBody: true),
        );
      }
    }
    return _dio!;
  }
}
