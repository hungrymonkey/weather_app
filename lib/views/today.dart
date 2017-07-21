import 'package:flutter/material.dart';
import './shared/icon_helper.dart';
import '../models/weather_entry.dart';
class TodayPage extends StatefulWidget{

  const TodayPage(this.todayEntry);

  final TodayEntry todayEntry;


  @override
  _TodayPage createState()=> new _TodayPage();
}
class _TodayPage extends State<TodayPage> {


  Widget build(BuildContext context){
    print('**** REBUILDING today page *****');
    if ( widget.todayEntry != null ) {
      return new Center(
          child: new IconLoader(widget.todayEntry.entry.iconType)
      );
    }else{
      return new Container(
        child: const CircularProgressIndicator(),
        alignment: FractionalOffset.center,
      );
    }
  }
}