import 'package:flutter/material.dart';
import 'shared/city_entry.dart';
import 'models/weather_entry.dart';
import 'views/today.dart';
import 'views/home.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting
        // the app, try changing the primarySwatch below to Colors.green
        // and then invoke "hot reload" (press "r" in the console where
        // you ran "flutter run", or press Run > Hot Reload App in
        // IntelliJ). Notice that the counter didn't reset back to zero;
        // the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MainApp(title: 'Weatherforcast'),
    );
  }


}


class MainApp extends StatefulWidget {
  MainApp({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;
  @override
  _MainApp createState() => new _MainApp();
}
class _MainApp extends State<MainApp>{

  CityEntry _homeCity = new CityEntry(id: 1850147, name: "Tokyo", country: "JP", lon: 35.689499, lat: 139.691711);

  Choice _selectedChoice = choices[0];
  TodayEntry _today;

  void _select(Choice  value) {
    setState(() {
      _selectedChoice = value;
    });
  }
  void _changeCity(CityEntry value){

      TodayEntry.fetch( cityEntry: _homeCity )
          .then( (TodayEntry t){
        setState(() {
          this._today = t;
          _homeCity = value;
        });
      });
  }
  @override
  void initState(){
    super.initState();
    if( _today == null){
      TodayEntry.fetch( cityEntry: _homeCity )
          .then( (TodayEntry t){
            setState(() {
              this._today = t;
          });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(_selectedChoice.title),
          actions: <Widget> [
            new IconButton(
                icon: new Icon(choices[0].icon),
                onPressed: (){ _select(choices[0]); },
            ),
            new IconButton(
              icon: new Icon(choices[1].icon),
              onPressed: (){ _select(choices[1]); },
            ),
            new IconButton(
              icon: new Icon(choices[2].icon),
              onPressed: (){ _select(choices[2]); },
            ),
          ]
      ),
      body: new ChoiceCard(choice: _selectedChoice, todayEntry: _today),
    );
  }

}

class Choice{
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
  bool operator ==(other){
    return (other is Choice && other.title == title);
  }
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Today', icon: Icons.calendar_today),
  const Choice(title: 'Week', icon: Icons.view_week),
  const Choice(title: 'Select Location', icon: Icons.location_on)
];


class ChoiceCard extends StatelessWidget{
  const ChoiceCard({ Key key, this.choice, this.todayEntry }) : super(key: key);

  final Choice choice;
  final TodayEntry todayEntry;
  //final CityEntry homeCity;
  @override
  Widget build(BuildContext context){
    switch (choice.title){
      case 'Today':
        return new TodayPage(todayEntry);
      case 'Week':
        return new MyHomePage();
      default:
        return new MyHomePage();
    }
  }
}