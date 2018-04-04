import 'dart:math';

import 'package:flutter/material.dart';

import '../ui/image_radar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double imageRadarSize = min(size.height, size.width) / 4;

    return new Container(
      child: new Center(
        child: new ImageRadar(
          height: imageRadarSize,
          width: imageRadarSize,
          image: new NetworkImage('https://picsum.photos/200?image=38'),
        )
      )
    );
  }
}
