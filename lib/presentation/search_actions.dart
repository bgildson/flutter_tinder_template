import 'package:flutter/material.dart';
import 'rounded_button_icon.dart';

class SearchActions extends StatelessWidget {
  SearchActions({
    Key key,
    this.onBackPressed,
    this.onNopePressed,
    this.onSuperLikePressed,
    this.onLikePressed,
    this.onBoostPressed,
  }) : super(key: key);

  final VoidCallback onBackPressed;
  final VoidCallback onNopePressed;
  final VoidCallback onSuperLikePressed;
  final VoidCallback onLikePressed;
  final VoidCallback onBoostPressed;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Container(
            width: 60.0,
            height: 60.0,
            child: new Center(
              child: new RoundedButtonIcon(
                icon: Icons.replay,
                iconSize: 25.0,
                padding: 10.0,
                activeResizeFactor: 0.9,
                color: Colors.white,
                iconColor: Colors.yellow[700],
                iconDisabledColor: Colors.black12,
                onPressed: onBackPressed,
              )
            )
          ),
          new Container(
            width: 60.0,
            height: 60.0,
            child: new Center(
              child: new RoundedButtonIcon(
                icon: Icons.close,
                iconSize: 30.0,
                padding: 15.0,
                activeResizeFactor: 0.8,
                color: Colors.white,
                iconColor: Colors.redAccent,
                iconDisabledColor: Colors.black12,
                onPressed: onNopePressed,
              )
            )
          ),
          new Container(
            width: 60.0,
            height: 60.0,
            child: new Center(
              child: new RoundedButtonIcon(
                icon: Icons.star,
                iconSize: 25.0,
                padding: 10.0,
                activeResizeFactor: 0.9,
                color: Colors.white,
                iconColor: Colors.lightBlue,
                iconDisabledColor: Colors.black12,
                onPressed: onSuperLikePressed,
              )
            )
          ),
          new Container(
            width: 60.0,
            height: 60.0,
            child: new Center(
              child: new RoundedButtonIcon(
                icon: Icons.favorite,
                iconSize: 30.0,
                padding: 15.0,
                activeResizeFactor: 0.8,
                color: Colors.white,
                iconColor: Colors.greenAccent[400],
                iconDisabledColor: Colors.black12,
                onPressed: onLikePressed,
              )
            )
          ),
          new Container(
            width: 60.0,
            height: 60.0,
            child: new Center(
              child: new RoundedButtonIcon(
                icon: Icons.flash_on,
                iconSize: 25.0,
                padding: 10.0,
                activeResizeFactor: 0.9,
                color: Colors.white,
                iconColor: Colors.purple[400],
                iconDisabledColor: Colors.black12,
                onPressed: onBoostPressed,
              )
            )
          ),
        ]
      )
    );
  }
}
