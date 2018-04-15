import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget {
  ChatListItem({
    Key key,
    this.name,
    this.lastMessage,
    this.lastMessageByMe = false,
    this.imageUrl,
    this.onPressed,
  }) : super(key: key);

  final double _imageDiameter = 90.0;
  final double _defaultPadding = 15.0;
  final String name;
  final String lastMessage;
  final bool lastMessageByMe;
  final String imageUrl;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    double tileSize = MediaQuery.of(context).size.width;
    return new Material(
      color: Colors.white,
      child: new InkWell(
        onTap: onPressed,
        child: new Row(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.all(_defaultPadding),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(imageUrl)
                )
              ),
              height: _imageDiameter,
              width: _imageDiameter,
            ),
            new Container(
              width: tileSize - _imageDiameter - _defaultPadding * 2,
              height: _imageDiameter + _defaultPadding * 2,
              child: new DecoratedBox(
                decoration: new BoxDecoration(
                  border: new Border(
                    bottom: new BorderSide(
                      color: Colors.black12,
                      width: 1.0
                    )
                  )
                ),
                child: new Padding(
                  padding: new EdgeInsets.only(
                    top: _defaultPadding,
                    right: _defaultPadding,
                    bottom: _defaultPadding,
                  ),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: new Text(
                          name,
                          style: new TextStyle(
                            fontSize: 25.0
                          )
                        )
                      ),
                      new Row(
                        children: <Widget>[
                          lastMessageByMe
                            ? new Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: new Icon(
                                  Icons.reply,
                                  size: 16.0,
                                )
                              )
                            : new Container(),
                          new Expanded(
                            child: new Padding(
                              padding: new EdgeInsets.only(right: _defaultPadding),
                              child: new Text(
                                lastMessage,
                                style: new TextStyle(
                                  fontSize: 16.0
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                          )
                        ],
                      )
                    ],
                  )
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
