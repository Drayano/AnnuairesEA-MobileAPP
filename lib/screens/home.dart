import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:aea_app/global/routes.dart';
import 'package:aea_app/providers/entreprise_provider.dart';
import 'package:aea_app/widgets/search_card.dart';
import 'package:aea_app/widgets/home/suggestions.dart';
import 'package:aea_app/screens/entreprises/entreprises_list_view.dart';

class HomePage extends StatelessWidget {
  HomePage({
    required Key key,
  }) : super(key: key);

  Function showToast(BuildContext context, String search) {
    return () {
      print("Valeur recherche :"+search);
      Fluttertoast.showToast(
          msg: "Cette fonctionnalité est en cours de développement :))",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green.shade200,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EntrepriseListView(search: search)),
      );
    };
  }

  TextEditingController textEditingController = TextEditingController();


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
                    margin: const EdgeInsets.only(top: 80.0),
                    child: const Text(
                      "Effectuer une recherche",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: searchCard(
                        (value) {},
                        width,
                        showToast(context, textEditingController.text),
                        textEditingController),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: entrepriseCarousel(
                  context, entrepriseProvider.entrepriseList, "VIP"),
            ),
          ],
        ),
      ),
    );
  }
}
