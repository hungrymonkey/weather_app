import 'package:flutter/material.dart';
import '../shared/city_entry.dart';


class LocationPage extends StatefulWidget {
  const LocationPage({ Key key, this.currentCity, this.updater}) : super(key: key);
  final CityEntry currentCity;
  final ValueChanged<CityEntry> updater;
  @override
  _LocationPage createState() => new _LocationPage();
}
const double _kFlexibleSpaceMaxHeight = 128.0;
class _LocationPage extends State<LocationPage>{

  String _searchingQuery = '';
  String _resultQuery = '';
  List<String> _fetchCities = [];
  void sendUpdates(CityEntry value){
    if(widget.updater != null)
      widget.updater(value);
  }

  @override
  Widget build(BuildContext context){
    print('********* Location Page ');
    final TextStyle captionTextStyle = Theme.of(context).textTheme.title;
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
              expandedHeight: _kFlexibleSpaceMaxHeight,
              floating: true,
              snap: true,
              flexibleSpace: new FlexibleSpaceBar(
                  background: new Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      new Container(
                        child: new Center(
                            child: new Text('${widget.currentCity.name}, ${widget.currentCity.country}'
                                ,style: captionTextStyle),
                        ),
                      )
                    ],
                  )
              )
          ),
          new SliverList(
              delegate: new SliverChildListDelegate([_searchBar()])
          ),
          _buildValidCities(context),
        ]
      ),
    );
  }

  Widget _buildValidCities(BuildContext context){
    if (_fetchCities == null) { // NOTE which means loading
      return new SliverFillRemaining(
          child: new Center(
              child: new CircularProgressIndicator()
          )
      );
    }
    return

      new SliverList(
        delegate: new SliverChildListDelegate(
            <Widget>[
              new Container(
                margin: const EdgeInsets.all(8.0),
                child: new Card(
                  child: new Column(
                      children: <Widget>[
                        _createEntry(context, "Los Angles,US"),
                        _createEntry(context, "Tokyo,JP")
                      ]
                  ),
                )
              )
            ]
        ),
    );
  }

  Widget _searchBar(){
    return new Container(
        margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        child: new Card(
            child: new Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: new TextField(
                  onChanged: _handleSearchTextChanged,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.search),
                  ),
                )
            )
        )
    );
  }
  Widget _createEntry(BuildContext context, String s){

    return new ListTile(
        dense: true,
        title: new Text(s,),
        onTap: (){ _handleCityEntry(s); }
    );
  }
  void _handleCityEntry(String city){
    if(widget.updater != null){
      var tok = city.split(",");
      widget.updater(new CityEntry(name: tok[0], country: tok[1]));
    }
  }

  void _handleSearchTextChanged(String str) {
    if (str == _searchingQuery) { return; }
    if (str == '') { return; }

    setState((){
      _searchingQuery = str;
      _fetchCities = null;
    });


  }

}



