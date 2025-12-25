// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
  name: json['name'] as String,
  temp: (Weather._readTemp(json, 'temp') as num).toDouble(),
  description: Weather._readDescription(json, 'description') as String,
  icon: Weather._readIcon(json, 'icon') as String,
  latitude: (Weather._readLatitude(json, 'latitude') as num).toDouble(),
  longitude: (Weather._readLongitude(json, 'longitude') as num).toDouble(),
  tempMax: (Weather._readTempMax(json, 'tempMax') as num).toDouble(),
  tempMin: (Weather._readTempMin(json, 'tempMin') as num).toDouble(),
);

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
  'name': instance.name,
  'temp': instance.temp,
  'description': instance.description,
  'icon': instance.icon,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'tempMax': instance.tempMax,
  'tempMin': instance.tempMin,
};
