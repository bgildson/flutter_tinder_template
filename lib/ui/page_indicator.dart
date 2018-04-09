import 'dart:ui';

import 'package:flutter/material.dart';

final double kIconMinSize = 20.0;
final double kIconMaxSize = 40.0;
final double kIconHeight = 60.0;
final double kIconWidth = 50.0;

class PageIndicator extends StatefulWidget {
  PageIndicator({
    this.indicators,
    this.controller
  });

  final List<dynamic> indicators;
  final PageController controller;

  @override
  _PageIndicatorState createState() => new _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  _PageIndicatorState() {
     _updaterCallback = () => setState(() {});
  }

  VoidCallback _updaterCallback;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updaterCallback);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updaterCallback);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentPage;
    double currentPosition;
    AxisDirection direction;
    if (widget.controller.hasClients) {
      currentPage = widget.controller.page.ceil();
      currentPosition = widget.controller.page;
      direction = widget.controller.position.axisDirection;
    } else {
      currentPage = widget.controller.initialPage;
      currentPosition = widget.controller.initialPage.toDouble();
    }
    double translation = (currentPage - currentPosition).abs();
    double screenWidth = MediaQuery.of(context).size.width;
    double baseTranslation = (screenWidth / 2 - kIconWidth / 2);
    double transformX = baseTranslation - baseTranslation * currentPosition;

    List<IndicatorPoint> points = [];
    for (int i = 0; i < widget.indicators.length; i++) {
      double transitionProgress = 0.0;

      if (direction == AxisDirection.left) {
        if (i == currentPage) {
          transitionProgress = 1 - translation;
        } else if (i == currentPage + 1) {
          transitionProgress = translation;
        }
      } else if (direction == AxisDirection.right) {
        if (i == currentPage) {
          transitionProgress = 1 - translation;
        } else if (i == currentPage - 1) {
          transitionProgress = translation;
        }
      } else {
        if (i == currentPage) {
          transitionProgress = 1.0;
        }
      }

      points.add(
        new IndicatorPoint(
          viewModel: new IndicatorPointViewModel(
            icon: widget.indicators[i]['icon'],
            transitionProgress: transitionProgress
          ),
          onPressed: () => onPointPressed(i),
        )
      );
    }

    return new Transform(
      transform: new Matrix4.translationValues(transformX, 0.0, 0.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: points
      ),
    );
  }

  void onPointPressed(int pageIndex) {
    if (widget.controller.page.ceil() != pageIndex)
      widget.controller.animateToPage(
        pageIndex,
        curve: Curves.easeOut,
        duration: new Duration(milliseconds: 300)
      );
  }
}

class IndicatorPoint extends StatelessWidget {
  IndicatorPoint({
    Key key,
    this.viewModel,
    this.onPressed,
  }) : super(key: key);

  final IndicatorPointViewModel viewModel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: this.onPressed,
      child: new Container(
        height: kIconHeight,
        width: kIconWidth,
        child: new Center(
          child: new Icon(
            viewModel.icon,
            color: Color.lerp(Colors.grey, Colors.redAccent, viewModel.transitionProgress),
            size: lerpDouble(kIconMinSize, kIconMaxSize, viewModel.transitionProgress),
          ),
        ),
      ),
    );
  }
}

class IndicatorPointViewModel {
  IndicatorPointViewModel({
    this.icon,
    this.color,
    this.transitionProgress
  });

  IconData icon;
  Color color;
  double transitionProgress;
}
