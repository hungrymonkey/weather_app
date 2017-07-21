import 'package:flutter/material.dart';
import './shared/icon_helper.dart';
import '../models/weather_entry.dart';
class TodayPage extends StatefulWidget{

  const TodayPage(this.todayEntry, this.weeklyForecast);

  final TodayEntry todayEntry;
  final WeeklyForecast weeklyForecast;


  @override
  _TodayPage createState()=> new _TodayPage();
}
class _TodayPage extends State<TodayPage> {

  Widget buildTodayCard(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

      return new Card(
      child:
      new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Center(
              child: new Text('Today',
                  style: textStyle)),
          new Text('${widget.todayEntry.entry.temp.toStringAsFixed(1)} °C',
              style: textStyle),
          new IconLoader(widget.todayEntry.entry.iconType),
          new Text('${widget.todayEntry.entry.condition}',
              style: textStyle),

        ],
      ),

     );

  }
  Widget buildTommorrowCard(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    if ( widget.weeklyForecast != null ) {
        return new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Center(
                  child: new Text('Tommorrow',
                      style: textStyle)),
              new Text(
                  '${widget.weeklyForecast.entries
                      .elementAt(8)
                      .temp
                      .toStringAsFixed(1)} °C',
                  style: textStyle),
              new IconLoader(widget.weeklyForecast.entries
                  .elementAt(8)
                  .iconType),
              new Text('${widget.weeklyForecast.entries
                  .elementAt(8)
                  .condition}',
                  style: textStyle),

            ],
          ),
        );
    }

      return new Card(
        child:  new Container(
          child: const CircularProgressIndicator(),
          alignment: FractionalOffset.center,
        ),
      );

  }
  Widget build(BuildContext context){
    print('**** REBUILDING today page *****');
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    if ( widget.todayEntry != null ){

      return new Column(
        children: <Widget>[
          new Center(
                child: new Text('${widget.todayEntry.city}, ${widget.todayEntry.country}',
                      style: textStyle)
          ),
          new Column(
              children: <Widget>[
                new Column(children: <Widget>[

                    new Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: buildTodayCard(context),
                    ),
                  ],
                ),
                new Column(children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: buildTommorrowCard(context),
                    ),
                  ],
                )


              ],
            ),
        ],
      );
      //return new Center(
      //    child: new IconLoader(widget.todayEntry.entry.iconType)
      //);
    }else{
      return new Card(
        child:  new Container(
          child: const CircularProgressIndicator(),
          alignment: FractionalOffset.center,
        ),
      );
    }

  }
}