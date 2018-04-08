import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class RoundedButtonIcon extends StatefulWidget {
  RoundedButtonIcon({
    Key key,
    @required this.icon,
    bool enabled: true,
    this.padding: 10.0,
    this.iconSize: 25.0,
    this.activeResizeFactor: 1.0,
    this.color: Colors.black12,
    this.iconColor: Colors.black26,
    Color activeColor,
    Color iconActiveColor,
    Color disabledColor,
    Color iconDisabledColor,
    this.onPressed,
  }) : this.enabled = enabled == true && onPressed != null,
       this.activeColor = activeColor ?? color,
       this.iconActiveColor = iconActiveColor ?? iconColor,
       this.disabledColor = disabledColor ?? color,
       this.iconDisabledColor = iconDisabledColor ?? iconColor,
       super(key: key);

  final IconData icon;
  final bool enabled;
  final double padding;
  final double iconSize;
  final double activeResizeFactor;
  final Color color;
  final Color activeColor;
  final Color iconColor;
  final Color iconActiveColor;
  final Color disabledColor;
  final Color iconDisabledColor;
  final VoidCallback onPressed;

  @override
  _RoundedButtonIconState createState() => new _RoundedButtonIconState();
}

class _RoundedButtonIconState extends State<RoundedButtonIcon> with SingleTickerProviderStateMixin {
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
  void dispose() {
    animationController.dispose();
    super.dispose();
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
          color: widget.enabled ? (_tapping ? widget.activeColor : widget.color) : widget.disabledColor,
        ),
        child: new Padding(
          padding: new EdgeInsets.all(paddingAnimation.evaluate(animation)),
          child: new Icon(
            widget.icon,
            size: iconSizeAnimation.evaluate(animation),
            color: widget.enabled ? (_tapping ? widget.iconActiveColor : widget.iconColor) : widget.iconDisabledColor,
          ),
        )
      )
    );
  }

  void onTapDownHandler(TapDownDetails details) {
    if (widget.enabled) {
      setState(() => _tapping = true);
      animationController.forward();
    }
  }

  void _tapLeave() {
    setState(() => _tapping = false);
    animationController.reverse();
  }

  void onTapUpHandler(TapUpDetails details) {
    if (widget.enabled) {
      _tapLeave();
      widget.onPressed();
    }
  }

  void onTapCancelHandler() {
    if (widget.enabled) {
      _tapLeave();
    }
  }
}
