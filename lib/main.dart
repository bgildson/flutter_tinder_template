import 'package:flutter/material.dart';

import './pages/main_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tinder Template',
      home: new MainPage()
    );
  }
}

void main() => runApp(new MyApp());
