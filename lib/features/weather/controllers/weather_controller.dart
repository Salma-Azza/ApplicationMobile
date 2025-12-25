import 'package:bz/core/network/weather/weather_dio_client.dart';
import 'package:bz/features/weather/data/models/weather.dart';
import 'package:bz/features/weather/repositories/weather_repository.dart';
import 'package:bz/utils/helpes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class WeatherController extends ChangeNotifier {
  Weather? weather;
  bool isLoading = false;
  String? errorMessage;
  String? city;
  bool currentLocation = true;

  final WeatherRepository _weatherRepository = WeatherRepository(
    WeatherDioClient.create(),
  );

  void searchWithCity(String query) async {
    if (query.isEmpty || query.length <= 2) return;
    setCurrentLocation(false);
    isLoading = true;
    notifyListeners();
    city = query;
    try {
      final Weather res = await _weatherRepository.getWeather(
        query: query,
        lang: "fr",
      );
      weather = res;
      errorMessage = null;
    } on DioException catch (err) {
      errorMessage =
          err.response?.data?['message'] ?? "Error during fetching data";
      city = null;
    } on Exception catch (_) {
      errorMessage = "Error during fetching data";
      city = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // _RS mean reset city to fetch by default
  Future<void> fetchingWeather() async {
    if ((city?.length ?? 0) <= 2) {
      city = null;
    } else {
      setCurrentLocation(true);
    }

    isLoading = true;
    notifyListeners();

    final Position? position = await getCurrentPosition();
    final double lat = position!.latitude;
    final double lon = position!.longitude;

    try {
      final Weather res = await _weatherRepository.getWeatherByCord(
        lang: "fr",
        lat: lat,
        lon: lon,
        city: city,
      );
      errorMessage = null;
      weather = res;
    } catch (_) {
      errorMessage = "Error during fetching data";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setCurrentLocation(bool current) {
    currentLocation = current;
    if (current) {
      city = null;
    }
    fetchingWeather();
  }
}
