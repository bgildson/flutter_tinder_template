import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({
    Key key,
    this.icon,
    this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Column(
        children: <Widget>[
          new IconButton(
            icon: new Icon(icon),
            onPressed: onPressed,
          ),
          new Text(title.toUpperCase()),
        ],
      ),
    );
  }
}
