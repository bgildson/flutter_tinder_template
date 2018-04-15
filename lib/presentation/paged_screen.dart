import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tinder_template/presentation/page_indicator.dart';

class PagedScreen extends StatefulWidget {
  PagedScreen({
    Key key,
    int initialPage,
    PageController controller,
    @required this.indicators,
    @required this.pages,
  }) : assert(initialPage != null || controller != null),
       assert(indicators.length == pages.length),
       assert(initialPage == null || (initialPage >= 0 && initialPage < pages.length)),
       _controller = controller ?? new PageController(initialPage: initialPage),
       super(key: key);

  final PageController _controller;
  final List<IconData> indicators;
  final List<Widget> pages;

  @override
  _PagedScreenState createState() => new _PagedScreenState(_controller);
}

class _PagedScreenState extends State<PagedScreen> {
  _PagedScreenState(this._controller);

  PageController _controller;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new DecoratedBox(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: new FractionalOffset(0.5, 0.3),
            end: new FractionalOffset(0.5, 1.0),
            tileMode: TileMode.clamp,
            colors: [Colors.white, Colors.grey[200]]
          )
        ),
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.only(top: 24.0),
              height: 60.0,
              child: new PageIndicator(
                controller: _controller,
                indicators: widget.indicators,
              )
            ),
            new Expanded(
              child: new PageView(
                controller: _controller,
                children: widget.pages,
              ),
            )
          ],
        ),
      )
    );
  }
}
