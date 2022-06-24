import 'package:flutter/material.dart';

import 'package:aea_app/widgets/secteurs/secteur_card.dart';

class SecteurListView extends StatefulWidget {
  final List data;
  final String title;

  const SecteurListView({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  @override
  _SecteurListViewState createState() => _SecteurListViewState();
}

class _SecteurListViewState extends State<SecteurListView> {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemCount: widget.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortrait ? 2 : 3,
          childAspectRatio: isPortrait ? 1 : 1.4,
        ),
        itemBuilder: (context, index) {
          return SecteurCard(
            img: "assets/" + widget.data[index].image,
            name: widget.data[index].name,
            detail: widget.data[index].detail,
          );
        },
      ),
    );
  }
}