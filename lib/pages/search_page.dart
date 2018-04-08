import 'package:flutter/material.dart';

import '../ui/image_radar.dart';
import '../ui/rounded_button_icon.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    double imageRadarSize = MediaQuery.of(context).size.width / 4;
    return new Column(
      children: <Widget>[
        new Expanded(
          child: new Center(
            child: new ImageRadar(
              height: imageRadarSize,
              width: imageRadarSize,
              image: new NetworkImage('https://picsum.photos/200?image=38'),
            )
          ),
        ),
        new Padding(
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
                    onPressed: () => print('replay'),
                  )
                )
              ),
              new Container(
                width: 60.0,
                height: 60.0,
                child: new Center(
                  child: new RoundedButtonIcon(
                    enabled: false,
                    icon: Icons.close,
                    iconSize: 30.0,
                    padding: 15.0,
                    activeResizeFactor: 0.8,
                    color: Colors.white,
                    iconColor: Colors.redAccent,
                    iconDisabledColor: Colors.black12,
                    onPressed: () => print('close'),
                  )
                )
              ),
              new Container(
                width: 60.0,
                height: 60.0,
                child: new Center(
                  child: new RoundedButtonIcon(
                    enabled: false,
                    icon: Icons.star,
                    iconSize: 25.0,
                    padding: 10.0,
                    activeResizeFactor: 0.9,
                    color: Colors.white,
                    iconColor: Colors.lightBlue,
                    iconDisabledColor: Colors.black12,
                    onPressed: () => print('star'),
                  )
                )
              ),
              new Container(
                width: 60.0,
                height: 60.0,
                child: new Center(
                  child: new RoundedButtonIcon(
                    enabled: false,
                    icon: Icons.favorite,
                    iconSize: 30.0,
                    padding: 15.0,
                    activeResizeFactor: 0.8,
                    color: Colors.white,
                    iconColor: Colors.greenAccent[400],
                    iconDisabledColor: Colors.black12,
                    onPressed: () => print('favorite'),
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
                    onPressed: () => print('flash_on'),
                  )
                )
              ),
            ]
          )
        )
      ],
    );
  }
}
