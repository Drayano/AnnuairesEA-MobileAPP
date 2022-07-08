import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import 'package:aea_app/providers/entreprise_provider.dart';
import 'package:aea_app/screens/views/entreprise_picture_slider.dart';
import 'package:aea_app/screens/entreprises/entreprise_contact_detail.dart';

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

    final bool businessNameSize =
        entrepriseModel.entrepriseList[entrepriseId].businessName.length < 18;

    final bool logo = (entrepriseModel.entrepriseList[entrepriseId].logo != null) &&
        (entrepriseModel.entrepriseList[entrepriseId].logo != "");
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
                      logo
                          ? Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(right: 0, bottom: 10),
                                child: Image(
                                  image: AssetImage(
                                    "assets/entreprises/${entrepriseModel.entrepriseList[entrepriseId].logo}",
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(), // Empty widget
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "${entrepriseModel.entrepriseList[entrepriseId].businessName},",
                              style: TextStyle(
                                fontSize: businessNameSize ? 20 : 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(74, 74, 74, .9),
                              ),
                            ),
                            Text(
                              entrepriseModel.entrepriseList[entrepriseId].state.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(74, 74, 74, .9),
                              ),
                            ),
                          ],
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
                            : const SizedBox.shrink(), // Empty widget
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
                  Text(
                    "Contact :",
                    // "${entrepriseModel.entrepriseList[entrepriseId].businessName},",
                    style: TextStyle(
                      fontSize: businessNameSize ? 20 : 14,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(74, 74, 74, .9),
                    ),
                  ),
                  ContactInfo(id: widget.id)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
