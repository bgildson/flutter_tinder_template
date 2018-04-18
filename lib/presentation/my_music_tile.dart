import 'package:flutter/material.dart';

class MyMusicTile extends StatelessWidget {
  MyMusicTile({
    Key key,
    this.music,
    this.artist,
    this.imageUrl,
  }) : super(key: key);

  final String music;
  final String artist;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width / 5;
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(bottom: 10.0),
                  child: new Text(
                    music,
                    style: new TextStyle(
                      color: Colors.black45,
                      fontSize: 20.0
                    ),
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(right: 5.0),
                      child: new Icon(
                        Icons.library_music,
                        color: Colors.greenAccent[700],
                      ),
                    ),
                    new Text(
                      artist,
                      style: new TextStyle(
                        color: Colors.black45,
                        fontSize: 18.0
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          new Container(
            height: imageSize,
            width: imageSize,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              image: new DecorationImage(
                image: new NetworkImage(imageUrl)
              )
            ),
            child: new Center(
              child: new Container(
                padding: new EdgeInsets.all(3.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.8)
                ),
                child: new Icon(
                  Icons.play_arrow,
                  color: Colors.redAccent,
                  size: imageSize / 4,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
