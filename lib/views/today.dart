import 'package:flutter/material.dart';
import './shared/icon_helper.dart';
import '../models/weather_entry.dart';


const double _kFlexibleSpaceMaxHeight = 128.0;

class TodayPage extends StatefulWidget{

  const TodayPage(this.todayEntry, this.weeklyForecast);

  final TodayEntry todayEntry;
  final WeeklyForecast weeklyForecast;


  @override
  _TodayPage createState()=> new _TodayPage();
}
class _TodayPage extends State<TodayPage> {

  Widget _buildTodayCard(BuildContext context) {
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
  Widget _buildTomorrowCard(BuildContext context) {
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
  List<Widget> _buildCards(BuildContext context){
    return <Widget>[
      new Column(children: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(20.0),
          child: _buildTodayCard(context),
        ),
      ],
      ),
      new Column(children: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(20.0),
          child: _buildTomorrowCard(context),
        ),
      ],
      )
    ];
  }
  Widget build(BuildContext context){
    print('**** REBUILDING today page *****');
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    if ( widget.todayEntry != null ){

      return new CustomScrollView(
        slivers: <Widget>[
        new SliverAppBar(
          pinned: true,
          expandedHeight: _kFlexibleSpaceMaxHeight,
          flexibleSpace: new FlexibleSpaceBar(
            title: new Text('${widget.todayEntry.city}, ${widget.todayEntry.country}'),
            // TODO(abarth): Wire up to the parallax in a way that doesn't pop during hero transition.
            background: new Stack(
              fit: StackFit.expand,
              children: <Widget>[

              ],
            ),

          ),
        ),
        new SliverList(delegate: new SliverChildListDelegate(_buildCards(context),)),
        ]);
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