import 'package:dio/dio.dart';

class WeatherDioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://api.openweathermap.org/",
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        queryParameters: {
          "appid": "d1c67704f35a14487bbf7f2ae6400b30",
          "units": "metric",
        },
        headers: {'Accept': 'application/json'},
      ),
    );

    dio.interceptors.add(
      LogInterceptor(request: true, requestBody: true, responseBody: true),
    );

    return dio;
  }
}
