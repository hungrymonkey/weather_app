import 'package:flutter/foundation.dart';

class CityEntry{
  CityEntry({
    @required this.id,
    @required this.name,
    @required this.country,
    @required this.lon,
    @required this.lat,
  }) : assert(id != null),
       assert(name!= null),
       assert(country != null),
       assert(lon != null),
       assert(lat != null);

  final num id;
  final String name;
  final String country;
  final num lon;
  final num lat;

  CityEntry copyWith({
    num id,
    String name,
    String country,
    num lon,
    num lat
  }){
    return new CityEntry(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      lon: country ?? this.lon,
      lat: country ?? this.lat,
    );
  }

}