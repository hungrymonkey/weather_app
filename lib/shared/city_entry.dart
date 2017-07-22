import 'package:flutter/foundation.dart';

class CityEntry{
  CityEntry({
     this.id,
    @required this.name,
    @required this.country,
     this.lon,
     this.lat,
  }) :
       assert(name!= null),
       assert(country != null);

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