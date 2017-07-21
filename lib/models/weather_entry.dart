import 'dart:core';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../shared/utils.dart';
import '../shared/forecast_entry.dart';
import '../shared/city_entry.dart';
class WeeklyForecast {
  final String city;
  final String country;
  final num lon;
  final num lat;
  final num id;
  final List<ForecastEntry> entries;
  final DateTime checkDate;
  WeeklyForecast(Map map) :
        city = map['city']['name'],
        id = map['city']['id'],
        lon = map['city']['coord']['lat'],
        lat = map['city']['coord']['lat'],
        country = map['city']['country'],
        entries = _extractEntries(map),
        checkDate = new DateTime.now() {

  }
  static List<ForecastEntry> _extractEntries(Map map){
    return (map['list'].values.map((Map m) {
      return new ForecastEntry(
        forecastTime: new DateTime.fromMillisecondsSinceEpoch(m['dt']),
        temp: Utils.k2c(m['main']['temp']),
        minTemp: Utils.k2c(m['main']['temp_min']),
        maxTemp: Utils.k2c(m['main']['temp_max']),
     //   rain: m['main']['rain']['3h'],
        condition: m['main']['weather'][0]['main'],
        iconType: m['main']['weather'][0]['icon'],

      );
    })).toList();
  }
  static Future<WeeklyForecast> fetch({CityEntry cityEntry}) async {
    final String BASE_URL = 'http://api.openweathermap.org/data/2.5/';
    final String KEY = '7358404975f3f98b3c5afdd631612c29';
    var url = '${BASE_URL}forecast?q=${cityEntry.name},${cityEntry.country}&appid=${KEY}';
    final Map map = JSON.decode( await http.read(url) );
    return new WeeklyForecast(map);
  }
}
class TodayEntry {
  final String city;
  final String country;
  final num lon;
  final num lat;
  final num id;
  final ForecastEntry entry;

  final DateTime checkDate;
  TodayEntry(Map map) :
    city = map['name'],
    id = map['id'],
    lon = map['coord']['lat'],
    lat = map['coord']['lat'],
    country = map['country'],
    entry = _extractEntry(map),
    checkDate = new DateTime.now() {

  }
  static _extractEntry(Map m){
    return new ForecastEntry(
      forecastTime: new DateTime.fromMillisecondsSinceEpoch(m['dt']),
      temp: Utils.k2c(m['main']['temp']),
      minTemp: Utils.k2c(m['main']['temp_min']),
      maxTemp: Utils.k2c(m['main']['temp_max']),
     // rain: m['main']['rain']['3h'],
      condition: m['weather'][0]['main'],
      iconType: m['weather'][0]['icon'],
    );
  }
  static Future<TodayEntry> fetch({CityEntry cityEntry}) async {
    final String BASE_URL = 'http://api.openweathermap.org/data/2.5/';
    final String KEY = '7358404975f3f98b3c5afdd631612c29';
    var url = '${BASE_URL}weather?q=${cityEntry.name},${cityEntry.country}&appid=${KEY}';
    print('**** query ${url} ****');

    final Map map = JSON.decode( await http.read(url) );
    print('*** creating Today Entry ****');
    return new TodayEntry(map);
  }


}