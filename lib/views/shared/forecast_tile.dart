import 'package:flutter/material.dart';

import './icon_helper.dart';
import '../../shared/forecast_entry.dart';
import '../../shared/utils.dart';
class ForecastTile extends StatefulWidget{
  final ForecastEntry entry;

  ForecastTile(this.entry);

  @override
  _ForecastTile createState() => new _ForecastTile();
}
class _ForecastTile extends State<ForecastTile>{
  @override
  Widget build(BuildContext context){
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      child: new Row(
        children: <Widget>[
          new Text(Utils.weekday(widget.entry.forecastTime.weekday),),
          new IconLoader(widget.entry.iconType),
          new Text(widget.entry.condition),
          new Text('${widget.entry.temp.toStringAsFixed(1)} °C'),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}