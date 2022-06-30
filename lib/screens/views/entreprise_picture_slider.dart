import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:aea_app/providers/entreprise_provider.dart';

class EntreprisePhotos extends StatefulWidget {
  final String id;
  // final List imageList;

  const EntreprisePhotos({
    Key? key,
    required this.id,
    // required this.imageList,
  }) : super(key: key);

  @override
  State<EntreprisePhotos> createState() => _EntreprisePhotosState();
}

class _EntreprisePhotosState extends State<EntreprisePhotos> {
  int _current = 0;

  onPageChanged(index) {
    setState(
      () {
        _current = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    final EntrepriseProvider entrepriseModel = Provider.of<EntrepriseProvider>(context);
    final int entrepriseId = int.parse(widget.id) - 1;

    List entreprisePhotos = [
      "assets/entreprises/${entrepriseModel.entrepriseList[entrepriseId].servicePhoto1}",
      "assets/entreprises/${entrepriseModel.entrepriseList[entrepriseId].servicePhoto2}",
      "assets/entreprises/${entrepriseModel.entrepriseList[entrepriseId].servicePhoto3}",
      "assets/entreprises/${entrepriseModel.entrepriseList[entrepriseId].servicePhoto4}",
      "assets/entreprises/${entrepriseModel.entrepriseList[entrepriseId].servicePhoto5}",
      "assets/entreprises/${entrepriseModel.entrepriseList[entrepriseId].servicePhoto6}"
    ];

    final slider = CarouselSlider(
      items: entreprisePhotos.map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: width,
                height: height / 2,
                // alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(60.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(i),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        viewportFraction: 0.8,
        height: isPortrait ? (height / 100) * 50 : height * .7,
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
