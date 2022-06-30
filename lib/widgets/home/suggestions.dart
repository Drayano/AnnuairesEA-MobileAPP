import 'package:flutter/material.dart';

import 'package:aea_app/screens/entreprises/single_entreprise_detail.dart';

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
                data[index].id,
                data[index].businessName,
                data[index].streetAddress,
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
  String id,
  String businessName,
  String streetAddress,
  String banner,
) {
  navigateEntrepriseList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SingleEntrepriseDetail(
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
