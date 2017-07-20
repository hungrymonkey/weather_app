import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './city_entry.dart';


class WeatherData{
  //Hardcoded again open weather map api
  final ICON_BASE_URL = 'http://openweathermap.org/img/w/';

  WeatherData(String jsonString ){
    this.jsonData = JSON.decode(jsonString);
    _getIcon(this.jsonData['weather'][0]['icon']);
    this.condition = this.jsonData['weather'][0]['main'];
  }
  Map jsonData;
  Image iconImage;
  String condition;
  //only use to to check to update every few hours as per Openweatherapi guidelines
  final DateTime creationTime = new DateTime.now();
  DateTime forecastDate;
  Future<Null> _getIcon(String s) async {
    var httpClient = createHttpClient();
    final Uint8List bytes = await httpClient.readBytes('${ICON_BASE_URL}${s}.png');
    iconImage = new Image.memory(bytes);
    //iconImage = new NetworkImage('${ICON_BASE_URL}${s}.png');
  }

}
class CityWeatherEntry{

  final String BASE_URL = 'http://api.openweathermap.org/data/2.5/';
  final String KEY = '7358404975f3f98b3c5afdd631612c29';
  CityWeatherEntry({@required this.cityEntry
  }):assert(cityEntry != null){
    _getData();
  }
  CityEntry cityEntry;


  WeatherData today;

  Future<Null> _getData() async {
    var httpClient = createHttpClient();
    var response = await httpClient.read('${BASE_URL}weather?q=${cityEntry.name},${cityEntry.country}&appid=${KEY}');

    today = new WeatherData(response);
  }
  update(){
    _getData();
  }
  setCity(CityEntry e){
    this.cityEntry = e;
    update();
  }
  getCity(){
    return cityEntry.name;
  }
  getCondition(){
    if(this.today.condition == null){
      return '';
    }else
      return this.today.condition;
  }
}