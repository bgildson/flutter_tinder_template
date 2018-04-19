import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tinder_template/presentation/current_image_indicator.dart';

class ImageCarousel extends StatefulWidget {
  ImageCarousel({
    Key key,
    PageController controller,
    int currentImageIndex,
    @required this.images,
    this.initialImageIndex: 0,
    this.tagBase: 'image-carousel-',
    this.onCurrentImageIndexChanged,
  }) : assert(images.length > 0),
       this.currentImageIndex = currentImageIndex ?? initialImageIndex,
       this.controller = controller ?? new PageController(initialPage: currentImageIndex),
       super(key: key);

  final List<String> images;
  final int initialImageIndex;
  final int currentImageIndex;
  final String tagBase;
  final ValueChanged<int> onCurrentImageIndexChanged;
  final PageController controller;

  @override
  _ImageCarouselState createState() => new _ImageCarouselState(controller);
}

class _ImageCarouselState extends State<ImageCarousel> {
  _ImageCarouselState(this._controller);

  final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_currentImageChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_currentImageChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return new GestureDetector(
      onTapUp: (TapUpDetails details) => onTapUp(screenSize / 2, details),
      child: new Container(
        height: screenSize,
        child: new Hero(
          tag: '${widget.tagBase}${widget.currentImageIndex}',
          child: new Stack(
            children: <Widget>[
              PageView(
                controller: _controller,
                children: widget.images.map((image) {
                  return new Container(
                    child: new Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                    width: double.infinity,
                  );
                }).toList()
              ),
              new Padding(
                padding: new EdgeInsets.only(
                  left: 10.0,
                  top: MediaQuery.of(context).padding.top + 5,
                  right: 10.0
                ),
                child: new CurrentImageIndicator(
                  size: widget.images.length,
                  activeIndex: widget.currentImageIndex,
                )
              )
            ]
          ),
        ),
      ),
    );
  }

  void _currentImageChanged() {
    int currentImageIndex = _controller.page.round();
    if (widget.currentImageIndex != currentImageIndex)
      widget.onCurrentImageIndexChanged(currentImageIndex);
  }

  void onTapUp(double halfScreenSize, TapUpDetails details) {
    if (halfScreenSize > details.globalPosition.dx) {
      if (widget.currentImageIndex > 0)
        _controller.jumpToPage(widget.currentImageIndex - 1);
    } else {
      if (widget.currentImageIndex < widget.images.length - 1)
        _controller.jumpToPage(widget.currentImageIndex + 1);
    }
  }
}
