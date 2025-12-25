import 'package:dio/dio.dart';

class OpenAiDio {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2:6000",
        connectTimeout: Duration(seconds: 5000),
        receiveTimeout: Duration(seconds: 5000),
        headers: {'Accept': 'application/json'},
      ),
    );

    dio.interceptors.add(
      LogInterceptor(request: true, requestBody: true, responseBody: true),
    );

    return dio;
  }
}
