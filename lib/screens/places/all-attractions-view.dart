import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aea_app/providers/attraction_provider.dart';
import 'package:aea_app/screens/places/attraction-list.dart';
import 'package:aea_app/widgets/attractions/attraction-card.dart';

class AllAttractionsView extends StatefulWidget {
  AllAttractionsView({required Key key}) : super(key: key);

  @override
  _AllAttractionsViewState createState() => _AllAttractionsViewState();
}

class _AllAttractionsViewState extends State<AllAttractionsView> {
  @override
  void initState() {
    super.initState();
  }

  _navigateAttractionList(data, title) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AttractionListView(data: data, title: title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final attProvider = Provider.of<AttractionProvider>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: attProvider.attractionList.length,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemBuilder: (context, index) {
          if (attProvider.attractionList != null) {
            return attractionSection(
                attProvider.attractionList[index].attractions,
                attProvider.attractionList[index].category);
          } else {
            return Container(
              height: height,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget attractionSection(data, String title) {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              _navigateAttractionList(data, title);
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(top: 18, bottom: 18, left: 5),
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    flex: 0,
                    child: Container(
                      child: Icon(Icons.arrow_forward),
                    )),
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
                    margin: EdgeInsets.only(right: 8),
                    child: AttractionCard(
                        img: "assets/" + data[index].image,
                        name: data[index].name,
                        country: data[index].country,
                        detail: data[index].detail),
                  );
                },
              ))
        ],
      ),
    );
  }
}
