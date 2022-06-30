import 'package:flutter/material.dart';

import 'package:aea_app/screens/annuaire_pdf/pdf_view.dart';

Widget secteurSection(data, String title, bool pdfview, [double? availableHeight]) {
  return Column(
    children: <Widget>[
      Text(title),
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
                "assets/secteurs/${data[index].image}",
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

Widget secteurCard(BuildContext context, String img, String name, String pdfid, String detail, bool pdfview) {
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
        onTap: navigateSecteurList,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
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
