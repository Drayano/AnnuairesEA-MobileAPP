import 'package:aea_app/models/entreprise.dart';
import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';

import 'package:aea_app/global/routes.dart';
import 'package:aea_app/global/styles.dart';
import 'package:aea_app/screens/views/entreprise_picture_slider.dart';
import 'package:aea_app/screens/entreprises/entreprise_contact_detail.dart';
import 'package:aea_app/screens/views/entreprise_youtube_player.dart';

class SingleEntrepriseDetail extends StatefulWidget {
  final int id;
  final EntrepriseModel entreprise;

  const SingleEntrepriseDetail({
    Key? key,
    required this.id,
    required this.entreprise,
  }) : super(key: key);

  @override
  State<SingleEntrepriseDetail> createState() => _SingleEntrepriseDetailState();
}

class _SingleEntrepriseDetailState extends State<SingleEntrepriseDetail> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final int entrepriseId = widget.id;

    final bool businessNameSize = widget.entreprise.businessName.length < 18;

    final bool logo = (widget.entreprise.logo != null) && (widget.entreprise.logo != "");
    const bool isVIP = true; //entrepriseModel.entrepriseList[entrepriseId].customerType;

    final bool videoEntreprise = (widget.entreprise.videoEntreprise != null) &&
        (widget.entreprise.videoEntreprise != "");

    final bool companyPresentation = (widget.entreprise.companyPresentation != null) &&
        (widget.entreprise.companyPresentation != "");

    final bool servicePhoto1 = (widget.entreprise.servicePhoto1 != null) &&
        (widget.entreprise.servicePhoto1 != servicePhotoRoute) &&
        (widget.entreprise.servicePhoto1 != "");

    final bool state = widget.entreprise.state != null;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            servicePhoto1
                ? SafeArea(
                    child: SizedBox(
                      width: width,
                      height: height / 2.25,
                      child: EntreprisePhotos(
                        id: (entrepriseId + 1).toString(),
                        entreprise: widget.entreprise,
                      ),
                    ),
                  )
                : const SafeArea(
                    child: SizedBox.shrink(),
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
                                  image: NetworkImage(
                                    "$logoRoute${widget.entreprise.logo}",
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
                              "${widget.entreprise.businessName},",
                              style: TextStyle(
                                fontSize: businessNameSize ? 20 : 14,
                                fontWeight: FontWeight.bold,
                                color: aeaGreen,
                              ),
                            ),
                            Text(
                              state ? widget.entreprise.state! : "",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: aeaGreen,
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
                  const SizedBox(height: 10),
                  videoEntreprise
                      ? YoutubePlayerEmbed(
                          videoEntreprise: widget.entreprise.videoEntreprise!,
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 10),
                  Text(
                    companyPresentation ? "Présentation de l'entreprise :" : "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: aeaGreen,
                    ),
                  ),
                  ReadMoreText(
                    companyPresentation ? widget.entreprise.companyPresentation! : "",
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '\nVoir plus',
                    trimExpandedText: '\nVoir moins',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      color: aeaRed,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      color: aeaRed,
                    ),
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Contact :",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: aeaGreen,
                    ),
                  ),
                  ContactInfo(id: widget.id, entreprise: widget.entreprise)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
