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
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

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
          isPortrait
              ? Container(
                  margin: const EdgeInsets.only(top: 75),
                  child: ListView.builder(
                    itemCount: entrepriseModel.entrepriseList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return EntrepriseCardView(
                        id: index,
                        businessName:
                            entrepriseModel.entrepriseList[index].businessName,
                        streetAddress:
                            entrepriseModel.entrepriseList[index].streetAddress,
                        banner:
                            "$bannerRoute${entrepriseModel.entrepriseList[index].banner}",
                      );
                    },
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 120),
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(4.0),
                    childAspectRatio: 1.45,
                    children: entrepriseModel.entrepriseList.map(
                      (item) {
                        return EntrepriseCardView(
                          id: item.id,
                          businessName: item.businessName,
                          streetAddress: item.streetAddress,
                          banner: "$bannerRoute${item.banner}",
                        );
                      },
                    ).toList(),
                  ),
                )
        ],
      ),
    );
  }
}
