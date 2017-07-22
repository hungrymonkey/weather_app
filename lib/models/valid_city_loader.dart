import 'dart:io';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import './../shared/trie.dart';
//declared in pubspec
const CITY_LIST = 'data/valid_cities.txt';

class CityNames{
  List<String> locations;
  Trie cTrie;
  CityNames(): cTrie = _handleTrie(){

  }
  Future<Set<String>> autocomplete(String s) async {
    return cTrie.autocomplete(s);
  }
  contains(String word){
    cTrie.contains(word);
  }
  static Future<String> _handleTrie() sync{
    var t = new Trie();
    rootBundle.loadString('assets/config.json').then(
        (String s) {
          for ()
        }
    );
    /*
    final file = new File(CITY_LIST);
    file.openRead()
        .transform(UTF8.decoder).transform(new LineSplitter())
        .forEach((word) => t.insert(word));
        */
    return t;
  }
}