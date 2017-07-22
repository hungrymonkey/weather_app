import 'package:flutter/foundation.dart';

class Trie {
  Trie() : root = new TrieNode(value: '', end: false){

  }
  TrieNode root;

  insert(String subString){
    root.insert(subString);
  }
  bool contains( String word) {
    return root.contains(word);
  }
  Set<String> autocomplete(String prefix, [limit=10]){
    return root.autocomplete(prefix,limit);
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
    if (word.length == 0) {
      return end;
    }
    String firstChar = word[0];
    return children.containsKey(firstChar) ?
    children[firstChar].contains(word.substring(1)) : false;
  }
  Set<String> all_prefixes(num limit){
    Set<String> prefixes = new Set();

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