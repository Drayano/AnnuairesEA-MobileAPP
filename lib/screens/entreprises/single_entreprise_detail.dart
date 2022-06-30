import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/providers/entreprise_provider.dart';
import 'package:aea_app/screens/views/entreprise_picture_slider.dart';

class SingleEntrepriseDetail extends StatefulWidget {
  final String id;

  const SingleEntrepriseDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SingleEntrepriseDetail> createState() => _SingleEntrepriseDetailState();
}

class _SingleEntrepriseDetailState extends State<SingleEntrepriseDetail> {
  bool isFavourite = false;

  _addToFavourite() {
    setState(
      () {
        isFavourite = !isFavourite;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    final entrepriseModel = Provider.of<EntrepriseProvider>(context);

    int entrepriseId = int.parse(widget.id) - 1;

    bool companyPresentation = entrepriseModel.entrepriseList[entrepriseId].companyPresentation != null;
    bool servicePhoto = entrepriseModel.entrepriseList[entrepriseId].servicePhoto1 != null;
    bool banner = entrepriseModel.entrepriseList[entrepriseId].banner != null;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height / 2,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(60.0),
                ),
                image: DecorationImage(
                  image: servicePhoto ? AssetImage("assets/entreprises/${entrepriseModel.entrepriseList[entrepriseId].servicePhoto1!}") : banner ? AssetImage("assets/entreprises/${entrepriseModel.entrepriseList[entrepriseId].banner!}") : const AssetImage(""),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          entrepriseModel.entrepriseList[entrepriseId].businessName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(74, 74, 74, .9),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: IconButton(
                          icon: Icon(
                            isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: _addToFavourite,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    companyPresentation ? entrepriseModel.entrepriseList[entrepriseId].companyPresentation! : "",
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.6,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
