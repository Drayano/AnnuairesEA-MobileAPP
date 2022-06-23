import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.asset("assets/pdf/2.pdf"),
      ),
    );
  }
}
