import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'rounded_button_icon.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({
    Key key,
    @required this.icon,
    @required this.text,
    this.textColor = Colors.black26,
    this.color = Colors.black12,
    this.iconColor = Colors.black26,
    this.activeColor = Colors.black12,
    this.iconActiveColor = Colors.black26,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color textColor;
  final Color color;
  final Color iconColor;
  final Color activeColor;
  final Color iconActiveColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: RoundedButtonIcon(
            icon: icon,
            color: color,
            iconColor: iconColor,
            activeColor: activeColor,
            iconActiveColor: iconActiveColor,
            onPressed: this.onPressed,
          ),
        ),
        new Text(
          text.toUpperCase(),
          style: new TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold
          )
        ),
      ],
    );
  }
}
