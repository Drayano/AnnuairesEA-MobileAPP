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
                      bool description = entrepriseModel.entrepriseList[index].description != null;
                      bool companyPresentation = entrepriseModel.entrepriseList[index].companyPresentation != null;
                      bool servicePhoto = (entrepriseModel.entrepriseList[index].servicePhoto1 != null) && (entrepriseModel.entrepriseList[index].servicePhoto1 != "");

                      return EntrepriseCardView(
                        businessName:
                            entrepriseModel.entrepriseList[index].businessName,
                        streetAddress:
                            entrepriseModel.entrepriseList[index].streetAddress,
                        description: description
                            ? entrepriseModel.entrepriseList[index].description!
                            : "",
                        advertisementStatut: entrepriseModel.entrepriseList[index].advertisementStatut,
                        statut: entrepriseModel.entrepriseList[index].statut,
                        companyPresentation: companyPresentation
                            ? entrepriseModel
                                .entrepriseList[index].companyPresentation!
                            : "",
                        servicePhoto1: servicePhoto
                            ? "assets/entreprises/${entrepriseModel.entrepriseList[index].servicePhoto1}"
                            : "assets/entreprises/${entrepriseModel.entrepriseList[index].banner}",
                        banner:
                            "assets/entreprises/${entrepriseModel.entrepriseList[index].banner}",
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
                    children: entrepriseModel.entrepriseList.map(
                      (item) {
                        bool description = item.description != null;
                        bool companyPresentation = item.companyPresentation != null;
                        bool servicePhoto = (item.servicePhoto1 != null) && (item.servicePhoto1 != "");

                        return EntrepriseCardView(
                          businessName: item.businessName,
                          streetAddress: item.streetAddress,
                          description: description ? item.description! : "",
                          advertisementStatut: item.advertisementStatut,
                          statut: item.statut,
                          companyPresentation: companyPresentation
                              ? item.companyPresentation!
                              : "",
                          servicePhoto1: servicePhoto
                              ? "assets/entreprises/${item.servicePhoto1}"
                              : "assets/entreprises/${item.banner}",
                          banner: "assets/entreprises/${item.banner}",
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
