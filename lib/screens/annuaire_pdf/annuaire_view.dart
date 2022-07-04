import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/providers/home_provider.dart';
import 'package:aea_app/screens/secteurs/secteur_cards_view.dart';

class AnnuairePDFView extends StatefulWidget {
  const AnnuairePDFView({
    Key? key,
  }) : super(key: key);

  @override
  State<AnnuairePDFView> createState() => _AnnuairePDFViewState();
}

class _AnnuairePDFViewState extends State<AnnuairePDFView> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    double height = MediaQuery.of(context).size.height - 126;

    return SafeArea(
      child: secteurSection(
        homeProvider.secteurs,
        "PDF par secteurs",
        true,
        height,
      ),
    );
  }
}
