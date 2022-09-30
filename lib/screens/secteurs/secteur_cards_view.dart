import 'package:flutter/material.dart';

import 'package:aea_app/global/routes.dart';
import 'package:aea_app/global/styles.dart';
import 'package:aea_app/screens/annuaire_pdf/pdf_view.dart';
import 'package:aea_app/screens/secteurs/secteur_home_view.dart';

Widget secteurSection(data, String title, bool pdfview, [double? availableHeight]) {
  return Column(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 5, bottom: 8),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: availableHeight,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 4),
              child: secteurCard(
                context,
                "$assetsSecteursDir${data[index].image}",
                "$assetsSecteursDir${data[index].imageThumb}",
                data[index].name,
                data[index].pdfid,
                data[index].detail,
                pdfview,
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
  String secteurImage,
  String secteurImageThumb,
  String name,
  String pdfid,
  String detail,
  bool pdfview,
) {
  navigateSecteurList() {
    if (pdfview) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecteurPDFView(
            pdfid: pdfid,
          ),
        ),
      );
    }

    else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecteurHomeView(
            secteurImage: secteurImage,
          ),
        ),
      );
    }
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
        onTap: navigateSecteurList,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(secteurImageThumb),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 5),
              child: Text(
                name,
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
