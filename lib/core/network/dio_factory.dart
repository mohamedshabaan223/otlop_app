import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:otlop_app/core/cache/secure_storage.dart';
import 'package:otlop_app/core/network/api_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static final _instanse = DioFactory._();
  factory DioFactory() => _instanse;
  late final Dio dio = _setupDio();
  final SecureStorage _secureStorage = SecureStorage();
  Dio _setupDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: Duration(minutes: 1),
        receiveTimeout: Duration(minutes: 1),
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _secureStorage.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await _secureStorage.clearCache();
          }
          handler.next(error);
        },
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
    return dio;
  }
}
