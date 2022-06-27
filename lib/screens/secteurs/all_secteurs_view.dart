import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/providers/home_provider.dart';
import 'package:aea_app/screens/secteurs/secteur_cards_view.dart';

class AllSecteursView extends StatefulWidget {
  const AllSecteursView({
    Key? key,
  }) : super(key: key);

  @override
  State<AllSecteursView> createState() => _AllSecteursViewState();
}

class _AllSecteursViewState extends State<AllSecteursView> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    double height = MediaQuery.of(context).size.height - 100;

    return SafeArea(
      child: secteurSection(
        homeProvider.secteurs,
        "Recherche par Secteurs",
        false,
        height,
      ),
    );
  }
}
