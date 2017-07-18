import 'package:flutter/material.dart';
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

  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: mainChoices.length,
        child: new Scaffold(
            appBar: new AppBar(
                title: const Text('Experimental App'),
                bottom: new TabBar(
                    isScrollable: true,
                    tabs: mainChoices.map((MainChoice choice){
                      return new Tab(
                        icon: new Icon(choice.icon),
                      );
                    }).toList()
                )
            ),
            body: new TabBarView(
                children: mainChoices.map((MainChoice c){
                  switch(c.title){
                    case 'Home':
                      return new MyHomePage();
                      break;
                    case 'Today':
                      return new MyHomePage();
                      break;
                  }
                }).toList()
            )
        )
    );
  }

}

class MainChoice{
  const MainChoice({ this.title, this.icon });
  final String title;
  final IconData icon;
  bool operator ==(other){
    return (other is MainChoice && other.title == title);
  }
}

const List<MainChoice> mainChoices = const <MainChoice>[
  const MainChoice(title: 'Week', icon: Icons.view_week),
  const MainChoice(title: 'Today', icon: Icons.calendar_today),
 // const MainChoice(title: 'Select Location', icon: Icons.location_on)
];


