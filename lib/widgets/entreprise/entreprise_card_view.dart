import 'package:flutter/material.dart';

import 'package:aea_app/screens/entreprises/single_entreprise_detail.dart';

class EntrepriseCardView extends StatelessWidget {
  final String id;
  final String businessName;
  final String streetAddress;
  final String description;
  final String advertisementStatut;
  final String statut;
  final String companyPresentation;
  final String? servicePhoto1;
  final String? servicePhoto2;
  final String? servicePhoto3;
  final String? servicePhoto4;
  final String? servicePhoto5;
  final String? servicePhoto6;
  final String banner;

  const EntrepriseCardView({
    Key? key,
    required this.id,
    required this.businessName,
    required this.streetAddress,
    required this.description,
    required this.advertisementStatut,
    required this.statut,
    required this.companyPresentation,
    this.servicePhoto1,
    this.servicePhoto2,
    this.servicePhoto3,
    this.servicePhoto4,
    this.servicePhoto5,
    this.servicePhoto6,
    required this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Card(
      margin: isPortrait ? const EdgeInsets.only(left: 20, right: 20, bottom: 20) : const EdgeInsets.only(left: 15, right: 25, bottom: 80),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SingleEntrepriseDetail(
                id: id,
                businessName: businessName,
                streetAddress: streetAddress,
                description: description,
                advertisementStatut: advertisementStatut,
                statut: statut,
                companyPresentation: companyPresentation,
                servicePhoto1: servicePhoto1,
                servicePhoto2: servicePhoto2,
                servicePhoto3: servicePhoto3,
                servicePhoto4: servicePhoto4,
                servicePhoto5: servicePhoto5,
                servicePhoto6: servicePhoto6,
                banner: banner,
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Container(
              height: isPortrait ? h / 14 : w / 12,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(banner),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, left: 20, bottom: 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          businessName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          streetAddress,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
