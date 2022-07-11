import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/providers/entreprise_provider.dart';
import 'package:aea_app/widgets/home/suggestions.dart';
import 'package:aea_app/widgets/search_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({
    required Key key,
  }) : super(key: key);

  Function showToast() {
    return () {
      Fluttertoast.showToast(
          msg: "Cette fonctionnalité n'est pas encore disponible :)",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green.shade200,
          textColor: Colors.white,
          fontSize: 16.0);
    };
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
                  image: const AssetImage("assets/oran_background.jpg"),
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
                    child: searchCard((value) {}, width, showToast()),
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
