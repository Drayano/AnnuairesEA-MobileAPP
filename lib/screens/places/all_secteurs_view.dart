import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/providers/home_provider.dart';
import 'package:aea_app/screens/places/secteur_list.dart';
import 'package:aea_app/screens/places/single_place_detail.dart';

class AllSecteursView extends StatefulWidget {
  const AllSecteursView({
    required Key key,
  }) : super(key: key);

  @override
  _AllSecteursViewState createState() => _AllSecteursViewState();
}

class _AllSecteursViewState extends State<AllSecteursView> {
  @override
  void initState() {
    super.initState();
  }

  _navigateSecteurList(data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecteurListView(
          data: data,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return secteurSection(
            homeProvider.secteurs,
          );
        },
      ),
    );
  }
}

Widget secteurSection(data) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          height: 560, //160,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: data.length,
            // scrollDirection: Axis.horizontal,
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

Widget secteurCard(
    BuildContext context, String img, String name, String detail) {
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
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: navigateAttractionList,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 18, left: 5),
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
