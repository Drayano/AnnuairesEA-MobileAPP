import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlacesPictures extends StatefulWidget {
  final List imageList;
  const PlacesPictures({
    Key? key,
    required this.imageList,
  }) : super(key: key);
  @override
  _PlacesPicturesState createState() => _PlacesPicturesState();
}

class _PlacesPicturesState extends State<PlacesPictures> {
  int _current = 0;
  List places = [
    "img001.jpg",
    "img002.jpg",
    "img003.jpg",
    "img004.jpg",
    "img005.jpg"
  ];

  onPageChanged(index) {
    setState(
      () {
        _current = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final slider = CarouselSlider(
      viewportFraction: 0.8,
      height: isPortrait ? (height / 100) * 48 : height * .7,
      items: widget.imageList != null
          ? places.map(
              (i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.red,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image(
                        image: AssetImage(i),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              },
            ).toList()
          : [],
      autoPlay: false,
      enableInfiniteScroll: false,
      aspectRatio: 2.0,
      onPageChanged: onPageChanged,
      enlargeCenterPage: true,
    );

    return Container(
      child: Column(
        children: <Widget>[slider],
      ),
    );
  }
}
