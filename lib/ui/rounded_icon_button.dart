import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RoundedIconButton extends StatefulWidget {
  RoundedIconButton({
    Key key,
    @required this.icon,
    bool active: true,
    this.padding: 10.0,
    this.iconSize: 25.0,
    this.activeResizeFactor: 1.0,
    this.color: Colors.black12,
    this.iconColor: Colors.black26,
    Color activeColor,
    Color iconActiveColor,
    Color inactiveColor,
    Color iconInactiveColor,
    this.onPressed,
  }) : this.active = active == true && onPressed != null,
       this.activeColor = activeColor ?? color,
       this.iconActiveColor = iconActiveColor ?? iconColor,
       this.inactiveColor = inactiveColor ?? color,
       this.iconInactiveColor = iconInactiveColor ?? iconColor,
       super(key: key);

  final IconData icon;
  final bool active;
  final double padding;
  final double iconSize;
  final double activeResizeFactor;
  final Color color;
  final Color activeColor;
  final Color iconColor;
  final Color iconActiveColor;
  final Color inactiveColor;
  final Color iconInactiveColor;
  final VoidCallback onPressed;

  @override
  _RoundedIconButtonState createState() => new _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  Tween<double> iconSizeAnimation;
  Tween<double> paddingAnimation;
  bool _tapping = false;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      duration: new Duration(milliseconds: 100),
      vsync: this
    );

    animation = new CurvedAnimation(
      parent: animationController,
      curve: Curves.linear
    )..addListener(() => setState((){}));

    iconSizeAnimation = new Tween(
      begin: widget.iconSize,
      end: widget.iconSize * widget.activeResizeFactor
    );

    paddingAnimation = new Tween(
      begin: widget.padding,
      end: widget.padding * widget.activeResizeFactor
    );
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: onTapDownHandler,
      onTapUp: onTapUpHandler,
      onTapCancel: onTapCancelHandler,
      child: new Container(
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: widget.active ? (_tapping ? widget.activeColor : widget.color) : widget.inactiveColor,
        ),
        child: new Padding(
          padding: new EdgeInsets.all(paddingAnimation.evaluate(animation)),
          child: new Icon(
            widget.icon,
            size: iconSizeAnimation.evaluate(animation),
            color: widget.active ? (_tapping ? widget.iconActiveColor : widget.iconColor) : widget.iconInactiveColor,
          ),
        )
      )
    );
  }

  void onTapDownHandler(TapDownDetails details) {
    if (widget.active) {
      setState(() => _tapping = true);
      animationController.forward();
    }
  }

  void _tapLeave() {
    setState(() => _tapping = false);
    animationController.reverse();
  }

  void onTapUpHandler(TapUpDetails details) {
    if (widget.active) {
      _tapLeave();
      widget.onPressed();
    }
  }

  void onTapCancelHandler() {
    if (widget.active) {
      _tapLeave();
    }
  }
}
