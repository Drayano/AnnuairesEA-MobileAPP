import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/providers/home_provider.dart';
import 'package:aea_app/widgets/home/suggestions.dart';
import 'package:aea_app/widgets/search_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              width: width,
              height: isPortrait ? height / 2 : width / 2,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(60.0)),
                image: DecorationImage(
                  image: const AssetImage('assets/img004.jpg'),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7),
                    BlendMode.dstATop,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 80.0),
                    child: const Text(
                      "Where do you want to go ?",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: searchCard((value) {}, width, () {}),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: secteurSection(homeProvider.suggestionList, "Suggestions"),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: secteurSection(homeProvider.topRatedPlaces, "Top Rated"),
            ),
          ],
        ),
      ),
    );
  }
}
