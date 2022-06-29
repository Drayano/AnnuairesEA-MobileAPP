import 'package:flutter/material.dart';

import 'package:aea_app/screens/views/single_entreprise_detail.dart';

Widget secteurSection(data, String title) {
  return Column(
    children: <Widget>[
      InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 8, bottom: 18, left: 5),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 0,
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 160,
        child: ListView.builder(
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 160,
              margin: const EdgeInsets.only(right: 4),
              child: secteurCard(
                context,
                data[index].businessName,
                data[index].streetAddress,
                data[index].description,
                data[index].advertisementStatut,
                data[index].statut,
                data[index].companyPresentation,
                "assets/entreprises/${data[index].servicePhoto1}",
                "assets/entreprises/${data[index].banner}",
              ),
            );
          },
        ),
      )
    ],
  );
}

Widget secteurCard(
  BuildContext context,
  String businessName,
  String streetAddress,
  String description,
  String advertisementStatut,
  String statut,
  String companyPresentation,
  String servicePhoto1,
  String banner,
) {
  navigateEntrepriseList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          bool servicePhoto = (servicePhoto1 != null) && (servicePhoto1 != "assets/entreprises/");

          return SingleEntrepriseDetail(
            businessName: businessName,
            streetAddress: streetAddress,
            description: description,
            advertisementStatut: advertisementStatut,
            statut: statut,
            companyPresentation: companyPresentation,
            servicePhoto1: servicePhoto ? servicePhoto1 : banner,
            banner: banner,
          );
        },
      ),
    );
  }

  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: navigateEntrepriseList,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(banner),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 5),
              child: Text(
                businessName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromRGBO(74, 74, 74, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
