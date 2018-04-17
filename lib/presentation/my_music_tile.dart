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
    return new Container(
      // color: Colors.green,
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
            height: MediaQuery.of(context).size.width / 5,
            width: MediaQuery.of(context).size.width / 5,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              image: new DecorationImage(
                image: new NetworkImage(imageUrl)
              )
            ),
          )
        ],
      ),
    );
  }
}
