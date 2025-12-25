import 'package:bz/features/weather/data/api/weather_api.dart';
import 'package:bz/features/weather/data/models/weather.dart';
import 'package:dio/dio.dart';

class WeatherRepository {
  late final WeatherApi _api;

  WeatherRepository(Dio dio) : _api = WeatherApi(dio);

  Future<Weather> getWeather({required String query, required String lang}) =>
      _api.getWeatherFlexible(city: query, lang: lang);

  Future<Weather> getWeatherByCord({
    required String lang,
    double? lat,
    double? lon,
    String? city,
  }) => _api.getWeatherFlexible(lat: lat, lon: lon, lang: lang, city: city);
}
