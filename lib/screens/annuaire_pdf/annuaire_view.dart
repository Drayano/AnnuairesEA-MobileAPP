import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/screens/annuaire_pdf/annuaire_pdf_cards.dart';
import 'package:aea_app/providers/home_provider.dart';

class AnnuairePDFView extends StatefulWidget {
  const AnnuairePDFView({
    Key? key,
  }) : super(key: key);

  @override
  _AnnuairePDFViewState createState() => _AnnuairePDFViewState();
}

class _AnnuairePDFViewState extends State<AnnuairePDFView> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: secteurSection(homeProvider.secteurs),
    );
  }
}
