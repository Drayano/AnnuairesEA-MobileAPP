import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/providers/entreprise_provider.dart';
import 'package:aea_app/widgets/search_card.dart';
import 'package:aea_app/widgets/home/suggestions.dart';

class SecteurHomeView extends StatelessWidget {
  final String secteurImage;

  SecteurHomeView({
    Key? key,
    required this.secteurImage,
  }) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final entrepriseProvider = Provider.of<EntrepriseProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              width: width,
              height: height / 2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(secteurImage),
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
                    margin: const EdgeInsets.only(top: 55),
                    child: searchCard(context, (value) {}, width, textEditingController),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: entrepriseCarousel(context, entrepriseProvider.entrepriseList),
            ),
          ],
        ),
      ),
    );
  }
}
