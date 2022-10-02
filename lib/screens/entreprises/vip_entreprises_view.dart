import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/global/routes.dart';
import 'package:aea_app/providers/entreprise_provider.dart';
import 'package:aea_app/widgets/entreprise/entreprise_card_view.dart';

class EntrepriseListView extends StatefulWidget {
  const EntrepriseListView({
    Key? key,
  }) : super(key: key);

  @override
  State<EntrepriseListView> createState() => _EntrepriseListViewState();
}

class _EntrepriseListViewState extends State<EntrepriseListView> {
  @override
  Widget build(BuildContext context) {
    final EntrepriseProvider entrepriseModel = Provider.of<EntrepriseProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 50, left: 20),
                child: const Text(
                  "Entreprises VIP :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 75),
            child: ListView.builder(
              itemCount: entrepriseModel.entrepriseList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return EntrepriseCardView(
                  id: index,
                  businessName: entrepriseModel.entrepriseList[index].businessName,
                  streetAddress: entrepriseModel.entrepriseList[index].streetAddress,
                  banner: "$bannerRoute${entrepriseModel.entrepriseList[index].banner}",
                  entreprise: entrepriseModel.entrepriseList[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
