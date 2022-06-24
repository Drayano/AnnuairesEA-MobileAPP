import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlacesPictures extends StatefulWidget {
  final List imageList;
  const PlacesPictures({
    Key? key,
    required this.imageList,
  }) : super(key: key);
  @override
  State<PlacesPictures> createState() => _PlacesPicturesState();
}

class _PlacesPicturesState extends State<PlacesPictures> {
  // int _current = 0;
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
        // _current = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final slider = CarouselSlider(
      items: places.map(
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
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 0.8,
        height: isPortrait ? (height / 100) * 48 : height * .7,
        autoPlay: false,
        enableInfiniteScroll: false,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );

    return Column(
      children: <Widget>[slider],
    );
  }
}
