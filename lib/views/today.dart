import 'package:flutter/material.dart';

import '../shared/city_entry.dart';
import '../shared/city_weather_entry.dart';
class TodayPage extends StatefulWidget{

  const TodayPage(this.currentCity);

  final CityWeatherEntry currentCity;


  @override
  _TodayPage createState()=> new _TodayPage();
}
class _TodayPage extends State<TodayPage> {


  Widget build(BuildContext context){
    print('************ REBUILDING loading weather data');
    if(widget.currentCity.getCondition() == '') {
      return new Container(
        child: const CircularProgressIndicator(),
        alignment: FractionalOffset.center,
      );
    }else{
      return new Center(
        child: new Text("Today Page ${widget.currentCity.getCondition()}"),
      );
    }
  }
}