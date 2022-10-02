import 'package:flutter/material.dart';

import 'package:aea_app/global/styles.dart';
import 'package:aea_app/models/entreprise.dart';
import 'package:aea_app/screens/entreprises/single_entreprise_detail.dart';

class EntrepriseCardView extends StatelessWidget {
  final int id;
  final String businessName;
  final String streetAddress;
  final String banner;
  final EntrepriseModel entreprise;

  const EntrepriseCardView({
    Key? key,
    required this.id,
    required this.businessName,
    required this.streetAddress,
    required this.banner,
    required this.entreprise,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                entreprise: entreprise,
                id: id,
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Container(
              height: h / 14,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(banner),
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
                            color: aeaGreen,
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
