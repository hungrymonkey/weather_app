import 'package:flutter/foundation.dart';
//probably needs at least length 4.
//not going to test it
import 'dart:convert';
class Trie {
  Trie() : root = new TrieNode(value: '', end: false){

  }
  TrieNode root;

  insert(String word){
    root.insert(word.toLowerCase());
  }
  bool contains( String word) {
    return root.contains(word.toLowerCase());
  }
  Set<String> autocomplete(String word, {limit=10}){
    if(word == '')
      return new Set();
    return root.autocomplete(word.toLowerCase(),limit);
  }
}
class TrieNode {
  TrieNode({ @required this.value, this.end
  }) : children = new Map() {

  }
  final String value;
  final bool end;
  Map<String, TrieNode> children;


  insert(String subString) {
    TrieNode curr = this;
    for(var i = 0; i < subString.length; i++){
      String char = subString[i];
      if(!curr.children.containsKey(char)){
        curr.children[char] = new TrieNode(
            value: char, end: i + 1 == subString.length
        );
      }
      curr = curr.children[char];
    }

  }

  bool contains(String word) {
    return _contains(word);
  }
  bool _contains(String word){
    if (word.length == 0) {
      return end;
    }
    String firstChar = word[0];
    //String inMap = children
    return children.containsKey(firstChar) ?
    children[firstChar].contains(word.substring(1)) : false;
  }
  Set<String> all_prefixes(num limit){
    var words = _all_prefixes(this, "", limit);
    return words;
  }
  Set<String> _all_prefixes( TrieNode n, String s, num limit ){
    var result = new Set();
    for(var v in n.children.values){
      if( limit > result.length){


        for(var s in _all_prefixes(v, s+v.value, limit)) {
          if (result.length < limit) {
            result.add(s);
          } else
            break;
        };

      }else
        break;
    }

    if(n.end){
      result.add(s);
    }
    //print(result);
    return result;
  }

  Set<String> autocomplete(String prefix, num limit) {

    Set<String> result = new Set();
    //transverse the trie
    TrieNode curr = this;
    for(var i = 0; i < prefix.length; i++){
      String char = prefix[i];
      //Continue, return empty children if non are found

      if(curr.children.containsKey(char)){
        curr = curr.children[char];
      }else
        return result;
    }
    //grab all other prefixes
    Set<String> suffix = curr.all_prefixes(limit);
    suffix.forEach((String suf){ result.add(prefix+suf); });
    //really ugly uppercase the first char and the last two.

    return result;
  }

}