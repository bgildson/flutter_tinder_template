import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CurrentImageIndicator extends StatelessWidget {
  CurrentImageIndicator({
    Key key,
    @required this.size,
    this.activeIndex: 0,
  }) : super(key: key);

  final int size;
  final int activeIndex;

  Widget _buildIndicator(bool active) {
    return new Expanded(
      flex: 1,
      child: new Container(
        height: 6.0,
        margin: new EdgeInsets.all(2.0),
        decoration: new BoxDecoration(
          color: active ? Colors.white : Colors.black.withOpacity(0.2),
          borderRadius: new BorderRadius.all(new Radius.circular(5.0))
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: new List.generate(size, (index) => 
        _buildIndicator(index == activeIndex))
    );
  }
}
