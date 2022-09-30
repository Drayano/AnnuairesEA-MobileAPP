import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/global/routes.dart';
import 'package:aea_app/providers/entreprise_provider.dart';
import 'package:aea_app/widgets/search_card.dart';
import 'package:aea_app/widgets/home/suggestions.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final entrepriseProvider = Provider.of<EntrepriseProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              width: width,
              height: isPortrait ? height / 2 : width / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      const AssetImage("${assetsRootDir}oran_background.jpg"),
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
                    child: searchCard(
                      context,
                        (value) {},
                        width,
                        textEditingController),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: entrepriseCarousel(
                  context, entrepriseProvider.entrepriseList),
            ),
          ],
        ),
      ),
    );
  }
}
