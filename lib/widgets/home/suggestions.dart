import 'package:flutter/material.dart';

import 'package:aea_app/screens/places/single_place_detail.dart';

Widget secteurSection(data, String title) {
  return Container(
    child: Column(
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
              Expanded(
                flex: 0,
                child: Container(
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ),
        Container(
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
                  "assets/" + data[index].image,
                  data[index].name,
                  data[index].detail,
                ),
              );
            },
          ),
        )
      ],
    ),
  );
}

Widget secteurCard(BuildContext context, String img, String name, String detail) {
  navigateAttractionList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SinglePlaceDetail(
          image: img,
          name: name,
          detail: detail,
        ),
      ),
    );
  }

  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: navigateAttractionList,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, left: 5),
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
