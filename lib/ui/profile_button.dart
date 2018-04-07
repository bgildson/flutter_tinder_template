import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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
          child: RoundedIconButton(
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

class RoundedIconButton extends StatefulWidget {
  RoundedIconButton({
    Key key,
    @required this.icon,
    this.color = Colors.black12,
    this.iconColor = Colors.black26,
    this.activeColor = Colors.black12,
    this.iconActiveColor = Colors.black26,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final Color iconColor;
  final Color activeColor;
  final Color iconActiveColor;
  final VoidCallback onPressed;

  @override
  _RoundedIconButtonState createState() => new _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  bool _tapping = false;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: onTapDownHandler,
      onTapUp: onTapUpHandler,
      onTapCancel: onTapCancelHandler,
      child: new Container(
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: _tapping ? widget.activeColor : widget.color,
        ),
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Icon(
            widget.icon,
            size: 25.0,
            color: _tapping ? widget.iconActiveColor : widget.iconColor,
          ),
        )
      )
    );
  }

  void onTapDownHandler(TapDownDetails details) {
    setState(() => _tapping = true);
  }

  void onTapUpHandler(TapUpDetails details) {
    setState(() => _tapping = false);
    widget.onPressed();
  }

  void onTapCancelHandler() {
    setState(() => _tapping = false);
  }
}
