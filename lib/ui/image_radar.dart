import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ImageRadar extends StatefulWidget {
  ImageRadar({
    Key key,
    @required this.height,
    @required this.width,
    @required this.image,
  }) : super(key: key);

  final double height;
  final double width;
  final ImageProvider image;

  @override
  _ImageRadarState createState() => new _ImageRadarState();
}

class _ImageRadarState extends State<ImageRadar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Center(
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
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
          )
        )
      ]
    );
  }
}


class Radar extends StatefulWidget {
  Radar({
    Key key,
    this.initialSize,
    this.onCompleted,
  }) : super(key: key);

  final double initialSize;
  final VoidCallback onCompleted;

  @override
  _RadarState createState() => new _RadarState();
}

class _RadarState extends State<Radar> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  final Tween<double> opacityAnimation = new Tween(begin: 0.3, end: 0.0);
  final Tween<double> sizeAnimation = new Tween(begin: 0.0, end: 600.0);

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
      duration: new Duration(seconds: 5),
      vsync: this
    );

    animation = new CurvedAnimation(
      parent: controller,
      curve: Curves.linear
    )
    ..addListener(() => setState(() {}))
    ..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed)
        widget.onCompleted();
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new DecoratedBox(
      decoration: new BoxDecoration(
        border: Border.all(
          color: new Color.fromRGBO(255, 0, 0, opacityAnimation.evaluate(animation)),
          width: 2.0
        ),
        shape: BoxShape.circle,
        gradient: new RadialGradient(
          center: new Alignment(0.0, 0.0),
          radius: 1.0,
          colors: [
            Colors.transparent,
            new Color.fromRGBO(255, 0, 0, opacityAnimation.evaluate(animation))
          ]
        )
      ),
      child: new Container(
        height: sizeAnimation.evaluate(animation),
        width: sizeAnimation.evaluate(animation),
      ),
    );
  }
}
