import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import 'package:aea_app/providers/entreprise_provider.dart';
import 'package:aea_app/screens/views/entreprise_picture_slider.dart';

class SingleEntrepriseDetail extends StatefulWidget {
  final String id;

  const SingleEntrepriseDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SingleEntrepriseDetail> createState() => _SingleEntrepriseDetailState();
}

class _SingleEntrepriseDetailState extends State<SingleEntrepriseDetail> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final EntrepriseProvider entrepriseModel = Provider.of<EntrepriseProvider>(context);
    final int entrepriseId = int.parse(widget.id) - 1;
    const bool isVIP = true; //entrepriseModel.entrepriseList[entrepriseId].customerType;

    final bool companyPresentation =
        entrepriseModel.entrepriseList[entrepriseId].companyPresentation != null;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: SizedBox(
                width: width,
                height: height / 2.25,
                child: EntreprisePhotos(
                  id: (entrepriseId + 1).toString(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          entrepriseModel.entrepriseList[entrepriseId].businessName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(74, 74, 74, .9),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 0,
                        child: isVIP
                            ? Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 30,
                              )
                            : SizedBox.shrink(), // Empty widget
                      ),
                    ],
                  ),
                  ReadMoreText(
                    companyPresentation
                        ? entrepriseModel.entrepriseList[entrepriseId].companyPresentation!
                        : "",
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '\nVoir plus',
                    trimExpandedText: '\nVoir moins',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),

                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                  // Text(
                  //   companyPresentation
                  //       ? entrepriseModel.entrepriseList[entrepriseId].companyPresentation!
                  //       : "",
                  //   style: const TextStyle(
                  //     fontSize: 13,
                  //     height: 1.6,
                  //     color: Color.fromRGBO(51, 51, 51, 1),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
