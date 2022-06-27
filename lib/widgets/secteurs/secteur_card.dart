import 'package:flutter/material.dart';

import 'package:aea_app/screens/views/single_entreprise_detail.dart';

class SecteurCard extends StatelessWidget {
  final String img;
  final String name;
  final String detail;

  const SecteurCard({
    Key? key,
    required this.img,
    required this.name,
    required this.detail,
  }) : super(key: key);

  navigateSecteurList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SingleEntrepriseDetail(
          image: img,
          name: name,
          detail: detail,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: () {
            navigateSecteurList(context);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, left: 5),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromRGBO(74, 74, 74, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
