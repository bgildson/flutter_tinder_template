import 'package:flutter/material.dart';

class ChatListItem extends StatefulWidget {
  ChatListItem({
    Key key,
    this.name,
    this.lastMessage,
    this.lastMessageByMe = false,
    this.imageUrl,
    this.onPressed,
  }) : super(key: key);

  final String name;
  final String lastMessage;
  final bool lastMessageByMe;
  final String imageUrl;
  final VoidCallback onPressed;

  @override
  _ChatListItemState createState() => new _ChatListItemState();
}

class _ChatListItemState extends State<ChatListItem> {
  final double imageSize = 90.0;
  final double defaultPadding = 15.0;

  @override
  Widget build(BuildContext context) {
    double tileSize = MediaQuery.of(context).size.width;
    return new Material(
      color: Colors.white,
      child: new InkWell(
        onTap: widget.onPressed,
        child: new Row(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.all(defaultPadding),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(widget.imageUrl)
                )
              ),
              height: imageSize,
              width: imageSize,
            ),
            new Container(
              width: tileSize - imageSize - defaultPadding * 2,
              height: imageSize + defaultPadding * 2,
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
                    top: defaultPadding,
                    right: defaultPadding,
                    bottom: defaultPadding,
                  ),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: new Text(
                          widget.name,
                          style: new TextStyle(
                            fontSize: 25.0
                          )
                        )
                      ),
                      new Row(
                        children: <Widget>[
                          widget.lastMessageByMe
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
                              padding: new EdgeInsets.only(right: defaultPadding),
                              child: new Text(
                                widget.lastMessage,
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
