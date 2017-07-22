import 'package:test/test.dart';
import "dart:async";
import './../lib/models/valid_city_loader.dart';
import 'dart:core';

void main() {
  CityNames cNames = new CityNames();
  test("contains", () async{
    expect(cNames.contains("figgy"),false);
  });
  test("contains", () async{
    expect(cNames.contains("Los Angeles,US"),true);
  });
}