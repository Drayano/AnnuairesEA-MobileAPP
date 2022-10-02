import 'package:aea_app/models/entreprise.dart';
import 'package:flutter/material.dart';

import 'package:aea_app/global/routes.dart';
import 'package:aea_app/global/styles.dart';
import 'package:aea_app/screens/entreprises/single_entreprise_detail.dart';
import 'package:aea_app/screens/entreprises/vip_entreprises_view.dart';

Widget entrepriseCarousel(BuildContext context, data) {
  return Column(children: <Widget>[
    SizedBox(
      height: 160,
      child: ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 4),
            child: secteurCard(context, index, data[index].businessName,
                "$logoRoute${data[index].logo}", data[index]),
          );
        },
      ),
    ),
  ]);
}

Widget secteurCard(BuildContext context, int id, String businessName, String logo,
    EntrepriseModel entreprise) {
  navigateEntrepriseList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SingleEntrepriseDetail(
            entreprise: entreprise,
            id: id,
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
        color: backgroundColor,
      ),
      child: InkWell(
        onTap: navigateEntrepriseList,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            (logo != "") && (logo != logoRoute)
                ? Container(
                    height: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(logo),
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 90,
                  ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 5),
              child: Text(
                businessName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: aeaGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
