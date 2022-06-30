import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
        body: SfPdfViewer.asset("assets/pdf/${widget.pdfid}.pdf"),
      ),
    );
  }
}
