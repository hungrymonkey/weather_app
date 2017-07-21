import 'package:flutter/material.dart';

import './shared/icon_helper.dart';
import '../models/weather_entry.dart';
class WeeklyPage extends StatefulWidget{

  const WeeklyPage(this.weeklyForecast);

  final WeeklyForecast weeklyForecast;


  @override
  _WeeklyPage createState()=> new _WeeklyPage();
}

class _WeeklyPage extends State<WeeklyPage> {


  Widget buildWeekly(BuildContext context){
    return new Center(
      child: new Text("weekly page"),
    );
  }
  @override
  Widget build(BuildContext context) {
      return new Center(
          child: new Text("weekly page"),
      );
  }
}