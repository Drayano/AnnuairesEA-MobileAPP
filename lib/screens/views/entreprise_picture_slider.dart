import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EntreprisePhotos extends StatefulWidget {
  final List imageList;
  const EntreprisePhotos({
    Key? key,
    required this.imageList,
  }) : super(key: key);
  @override
  State<EntreprisePhotos> createState() => _EntreprisePhotosState();
}

class _EntreprisePhotosState extends State<EntreprisePhotos> {
  // int _current = 0;
  List entreprisePhotos = [
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
      items: entreprisePhotos.map(
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
