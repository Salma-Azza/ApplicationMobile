import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_client.g.dart';

@RestApi()
abstract class WeatherClient {
  factory WeatherClient(Dio dio, {String baseUrl}) = _WeatherClient;
}
