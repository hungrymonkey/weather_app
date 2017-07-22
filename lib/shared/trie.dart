import 'package:flutter/foundation.dart';
//probably needs at least length 4.
//not going to test it
class Trie {
  Trie() : root = new TrieNode(value: '', end: false){

  }
  TrieNode root;

  insert(String word){
    root.insert(word);
  }
  bool contains( String word) {
    return root.contains(word);
  }
  Set<String> autocomplete(String word, [limit=10]){
    return root.autocomplete(word,limit);
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
    var lowerString = subString.toLowerCase();
    for(var i = 0; i < lowerString.length; i++){
      String char = lowerString[i];
      if(!curr.children.containsKey(char)){
        curr.children[char] = new TrieNode(
            value: char, end: i + 1 == lowerString.length
        );
      }
      curr = curr.children[char];
    }

  }

  bool contains(String word) {
    return _contains(word.toLowerCase());
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
    Set<String> words = new Set();
    _all_prefixes(this, "", words, limit);
    var result = words.map((String s) {
      s[0].toUpperCase() + s.substring(2,s.length-2)+s.substring(s.length-2).toUpperCase();
    }).toSet();
    return result;
  }
  _all_prefixes( TrieNode n, String s, Set<String> words, num limit ){
    if(limit >= words.length)
      return words;
    if(n.end){
      words.add(s+n.value);
    }
    n.children.values.forEach((v){
      _all_prefixes(v, s, words, limit);
    });

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
    return result;
  }
}