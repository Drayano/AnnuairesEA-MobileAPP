import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/providers/secteur_provider.dart';
import 'package:aea_app/screens/places/secteur_list.dart';
import 'package:aea_app/widgets/secteurs/secteur_card.dart';

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

  _navigateSecteurList(data, title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecteurListView(
          data: data,
          title: title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final attProvider = Provider.of<SecteurProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: attProvider.secteurList.length,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemBuilder: (context, index) {
          if (attProvider.secteurList != null) {
            return secteurSection(
              attProvider.secteurList[index].secteurs,
              attProvider.secteurList[index].category,
            );
          } else {
            return Container(
              height: height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget secteurSection(data, String title) {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              _navigateSecteurList(data, title);
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 18, bottom: 18, left: 5),
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
            height: 170,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 190,
                  margin: const EdgeInsets.only(right: 8),
                  child: SecteurCard(
                      img: "assets/" + data[index].image,
                      name: data[index].name,
                      detail: data[index].detail),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
