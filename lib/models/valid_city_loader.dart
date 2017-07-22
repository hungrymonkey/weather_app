
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import './../shared/trie.dart';
//declared in pubspec
const CITY_LIST = 'assets/res/valid_cities.txt';

class CityNames{
  List<String> locations;
  Trie cTrie;
  CityNames() {
    _handleTrie().then((Trie t ) => cTrie = t);
  }
  Future<Set<String>> autocomplete(String s) async {
    return cTrie.autocomplete(s);
  }
  static Future<Trie> createTrie() async {
    return await _handleTrie();
  }
  bool contains(String word){
    return cTrie.contains(word);
  }
  static Future<String> _loadData(String path) async {
    return await rootBundle.loadString(path);
  }

  static Future<Trie> _handleTrie() async {
    return await rootBundle.loadStructuredData(CITY_LIST, parseFile);

  }
  static Future<Trie> parseFile(String) async{
    Trie t = new Trie();
    for( var s in String.split('\n')){
      t.insert(s);
    }
    return t;
  }
}