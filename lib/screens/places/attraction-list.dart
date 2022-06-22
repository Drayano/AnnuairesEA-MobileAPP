import 'package:flutter/material.dart';
import 'package:aea_app/widgets/attractions/attraction-card.dart';

class AttractionListView extends StatefulWidget {
  final List data;
  final String title;

  AttractionListView({required this.data, required this.title});
  @override
  _AttractionListViewState createState() => _AttractionListViewState();
}

class _AttractionListViewState extends State<AttractionListView> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemCount: widget.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isPortrait ? 2 : 3,
              childAspectRatio: isPortrait ? 1 : 1.4),
          itemBuilder: (context, index) {
            return AttractionCard(
              img: "assets/" + widget.data[index].image,
              name: widget.data[index].name,
              country: widget.data[index].country,
              detail: widget.data[index].detail,
            );
          },
        ));
  }
}
