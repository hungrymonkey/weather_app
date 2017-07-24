import 'dart:typed_data';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IconLoader extends StatefulWidget{
  IconLoader(@required this.iconType,{ Key key }): super(key: key);
  final String iconType;
  final String ICON_BASE_URL = 'http://openweathermap.org/img/w/';
  @override
  _IconLoader createState() => new _IconLoader();
}
class _IconLoader extends State<IconLoader>{
  Widget image;
  @override
  void initState() {
    super.initState();

    _getImg();
  }

  Future<Null> _getImg() async {
    final Uint8List bytes = await http.readBytes('${widget.ICON_BASE_URL}${widget.iconType}.png');
    if(mounted) {
      setState(() {
        image = new Image.memory(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('building icon helper');
    if ( image == null ) {
      return new Container(
        child: const CircularProgressIndicator(),
        alignment: FractionalOffset.center,
      );
    } else {
      return image;
    }
  }
}