import 'package:bz/core/network/weather/weather_dio_client.dart';
import 'package:dio/dio.dart';

main() {
  final Dio dio = WeatherDioClient.create();

  // Print the full config
  print("Base URL: ${dio.options.baseUrl}");
  print("Connect Timeout: ${dio.options.connectTimeout}");
  print("Receive Timeout: ${dio.options.receiveTimeout}");
  print("Headers: ${dio.options.headers}");
  print("Response Type: ${dio.options.responseType}");
  print("Content Type: ${dio.options.contentType}");
  print("Queries : ${dio.options.queryParameters}");
}
