import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final String name;

  @JsonKey(readValue: _readTemp)
  final double temp;

  @JsonKey(readValue: _readDescription)
  final String description;

  @JsonKey(readValue: _readIcon)
  final String icon;

  @JsonKey(readValue: _readLongitude)
  final double longitude;

  @JsonKey(readValue: _readLatitude)
  final double latitude;

  @JsonKey(readValue: _readTempMax)
  final double tempMax;

  @JsonKey(readValue: _readTempMin)
  final double tempMin;

  Weather({
    required this.name,
    required this.temp,
    required this.description,
    required this.icon,
    required this.latitude,
    required this.longitude,
    required this.tempMax,
    required this.tempMin,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  // ------------------------------
  //      JSON Nested Readers
  // ------------------------------

  static Object? _readTemp(Map json, String _) =>
      (json["main"]["temp"] as num).toDouble();

  static Object? _readTempMax(Map json, String _) =>
      (json["main"]["temp_max"] as num).toDouble();

  static Object? _readTempMin(Map json, String _) =>
      (json["main"]["temp_min"] as num).toDouble();

  static Object? _readLongitude(Map json, String _) =>
      (json["coord"]["lon"] as num).toDouble();

  static Object? _readLatitude(Map json, String _) =>
      (json["coord"]["lat"] as num).toDouble();

  static Object? _readDescription(Map json, String _) =>
      json["weather"][0]["description"];

  static Object? _readIcon(Map json, String _) => json["weather"][0]["icon"];
}
