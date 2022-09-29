import 'package:aea_app/models/entreprise.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:aea_app/global/routes.dart';
import 'package:aea_app/providers/entreprise_provider.dart';

class EntreprisePhotos extends StatefulWidget {
  final String id;
  final EntrepriseModel entreprise;

  const EntreprisePhotos({
    Key? key,
    required this.id,
    required this.entreprise,
  }) : super(key: key);

  @override
  State<EntreprisePhotos> createState() => _EntreprisePhotosState();
}

class _EntreprisePhotosState extends State<EntreprisePhotos> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // final EntrepriseProvider entrepriseModel =
    //     Provider.of<EntrepriseProvider>(context);
    final int entrepriseId = int.parse(widget.id) - 1;

    List serviceCycle = [
      widget.entreprise.servicePhoto1,
      widget.entreprise.servicePhoto2,
      widget.entreprise.servicePhoto3,
      widget.entreprise.servicePhoto4,
      widget.entreprise.servicePhoto5,
      widget.entreprise.servicePhoto6
    ];

    List entreprisePhotos = [];

    int i = 0;
    while (entreprisePhotos.length < 6) {
      if ((serviceCycle[i] != null) && (serviceCycle[i] != "")) {
        entreprisePhotos.add("$servicePhotoRoute${serviceCycle[i]}");
      } else {
        break;
      }

      i++;
    }

    // Don't scroll if there's only 1 carousel image
    bool infiniteScrollBehaviour = entreprisePhotos.length > 1;

    final CarouselSlider slider = CarouselSlider(
      items: entreprisePhotos.map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: width,
                height: height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(i),
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
        height: isPortrait ? height / 2.25 : height * 0.7,
        autoPlay: true,
        enableInfiniteScroll: infiniteScrollBehaviour,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );

    return Column(
      children: <Widget>[slider],
    );
  }
}
