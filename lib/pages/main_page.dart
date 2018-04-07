import 'package:flutter/material.dart';

import '../ui/page_indicator.dart';
import './profile_page.dart';
import './search_page.dart';
import './chat_page.dart';

final INDICATORS = [
  { 'icon': Icons.person },
  { 'icon': Icons.person_pin_circle },
  { 'icon': Icons.message },
];

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller;

  _MainPageState() {
    controller = new PageController(initialPage: 1);
  }

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
              width: double.infinity,
              height: 60.0,
              child: new PageIndicator(
                indicators: INDICATORS,
                controller: controller,
              )
            ),

            new Expanded(
              child: new PageView(
                controller: controller,
                children: <Widget>[
                  new ProfilePage(),
                  new SearchPage(),
                  new ChatPage(),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
