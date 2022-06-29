import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
    final entrepriseModel = Provider.of<EntrepriseProvider>(context);
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 50, left: 20),
                child: const Text(
                  "Vos favoris :",
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
                        businessName: entrepriseModel.entrepriseList[index].businessName,
                        streetAddress: entrepriseModel.entrepriseList[index].streetAddress,
                        description: entrepriseModel.entrepriseList[index].description,
                        companyPresentation: entrepriseModel.entrepriseList[index].companyPresentation,
                        banner: "assets/entreprises/${entrepriseModel.entrepriseList[index].banner}",
                      );
                    },
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 120),
                  child: GridView.count(
                    crossAxisCount: 2,
                    // scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(4.0),
                    childAspectRatio: 1.45,
                    children: entrepriseModel.entrepriseList
                        .map(
                          (item) => EntrepriseCardView(
                            businessName: item.businessName,
                            streetAddress: item.streetAddress,
                            description: item.description,
                            companyPresentation: item.companyPresentation,
                            banner: "assets/entreprises/${item.banner}",
                          ),
                        )
                        .toList(),
                  ),
                )
        ],
      ),
    );
  }
}
