import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:aea_app/global/routes.dart';

class SecteurPDFView extends StatefulWidget {
  final String pdfid;

  const SecteurPDFView({
    Key? key,
    required this.pdfid,
  }) : super(key: key);

  @override
  State<SecteurPDFView> createState() => _SecteurPDFViewState();
}

class _SecteurPDFViewState extends State<SecteurPDFView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.asset("$assetsPdfDir${widget.pdfid}.pdf"),
      ),
    );
  }
}
