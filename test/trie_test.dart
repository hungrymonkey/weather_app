import 'package:test/test.dart';
import '../lib/shared/trie.dart';
import 'dart:core';
void main(){
  Trie t = new Trie();
  var words = ["piggy","pizza","pizaru","pikeb","poppy","poook"
  "pinny", "poooo","poing","power","polllo","apple","pearl","Toyko,JP"];
  words.sort();
  words.forEach((words){ t.insert(words); });
  //print(words.sublist(1,11).toSet());
  test("contains", () async{
    expect(t.contains("miggy"),false);
  });
  test("contains", () async{
    expect(t.contains("piggy"),true);
  });
  test("contains Tokyo", ()async{
    expect(t.contains("Toyko,JP"),true);
  });
  test("contains", () async{
    expect(t.contains("pizaru"),true);
  });
  test("contains", () async{
    expect(t.contains("pittty"),false);
  });
  test("contains", () async{
    expect(t.contains("prettty"),false);
  });
  test("contains", () async{
    expect(t.contains("poke"),false);
  });
  test("contains First letter cap", () async{
    expect(t.contains("Pizaru"),true);
  });
  test("contains First letter cap", () async{
    expect(t.contains("PizAru"),true);
  });
  test("autocomplete", () async{
    var wl = new List.from(words);
    expect(t.autocomplete("p",limit: 10),wl.sublist(2,12).toSet());
  });

}