import 'package:bz/core/network/weather/weather_client.dart';
import 'package:bz/features/weather/data/models/weather.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi extends WeatherClient {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET("/data/2.5/weather")
  Future<Weather> getWeatherFlexible({
    @Query("lat") double? lat,
    @Query("lon") double? lon,
    @Query("q") String? city,
    @Query("lang") String lang = 'en',
  });
}
