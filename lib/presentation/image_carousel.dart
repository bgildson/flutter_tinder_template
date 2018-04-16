import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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

  void _currentImageChanged() {
    int currentImageIndex = _controller.page.round();
    if (widget.currentImageIndex != currentImageIndex)
      widget.onCurrentImageIndexChanged(currentImageIndex);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_currentImageChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_currentImageChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double halfScreenSize = MediaQuery.of(context).size.width / 2;
    return new GestureDetector(
      onTapUp: (TapUpDetails details) => onTapUp(halfScreenSize, details),
      child: new Container(
        height: MediaQuery.of(context).size.width,
        child: new PageView.builder(
          controller: _controller,
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return new Hero(
              tag: '${widget.tagBase}$index',
              child: new Stack(
                children: <Widget>[
                  new PageView(
                    children: <Widget>[
                      new Container(
                        child: new Image.network(
                          widget.images[index],
                          fit: BoxFit.cover,
                        ),
                        width: double.infinity,
                      ),
                    ],
                  )
                ]
              )
            );
          },
        )
      )
    );
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
