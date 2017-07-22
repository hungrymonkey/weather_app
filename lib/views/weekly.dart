import 'package:flutter/material.dart';

import './shared/forecast_tile.dart';
import '../models/weather_entry.dart';

class WeeklyPage extends StatefulWidget{

  const WeeklyPage(this.weeklyForecast);

  final WeeklyForecast weeklyForecast;


  @override
  _WeeklyPage createState()=> new _WeeklyPage();
}

class _WeeklyPage extends State<WeeklyPage> {


  Widget _buildWeekly(BuildContext context){
    return new ListView(
      children: _getWeeklyTile(),
    );
  }
  _getWeeklyTile (){
    List<Widget> wid = new List();
    //hard coded 8 since forecast at 8 hr intervals
    for(var i = 0; i < widget.weeklyForecast.entries.length; i+=8 ){
      wid.add(new ForecastTile(widget.weeklyForecast.entries.elementAt(i)));
      print(widget.weeklyForecast.entries.elementAt(i).forecastTime.toString());
    }
    return wid;
  }
  @override
  Widget build(BuildContext context) {
      return _buildWeekly(context);
  }

}