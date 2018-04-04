import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class ImageRadar extends StatefulWidget {
  ImageRadar({
    Key key,
    @required this.height,
    @required this.width,
    @required this.image,
  }) : super(key: key);

  double height;
  double width;
  ImageProvider image;

  @override
  _ImageRadarState createState() => new _ImageRadarState();
}

class _ImageRadarState extends State<ImageRadar> {
  // Animation<double> _radar = 

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.grey,
        borderRadius: new BorderRadius.all(new Radius.circular(90.0)),
        border: Border.all(
          color: Colors.white,
          width: 5.0
        ),
        image: new DecorationImage(
          image: widget.image
        )
      ),
      height: widget.height,
      width: widget.width,
    );
  }
}
