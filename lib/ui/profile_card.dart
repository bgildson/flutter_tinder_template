import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({
    Key key,
    this.children
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new ClipPath(
          clipper: new BottomClipper(),
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
            ),
            child: new Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            )
          ),
        )
      ],
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.lineTo(0.0, size.height - 25.0);
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width * 0.75, size.height, size.width, size.height - 25.0);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
