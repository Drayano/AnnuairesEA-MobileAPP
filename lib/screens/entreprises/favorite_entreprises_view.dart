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
    final entrMdl = Provider.of<EntrepriseProvider>(context);
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
              Container(
                height: 40,
              ),
            ],
          ),
          isPortrait
              ? Container(
                  margin: const EdgeInsets.only(top: 90),
                  child: ListView.builder(
                    itemCount: entrMdl.entrepriseList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return EntrepriseCardView(
                        banner: "assets/entreprises/${entrMdl.entrepriseList[index].banner}",
                        businessName: entrMdl.entrepriseList[index].businessName,
                        streetAddress: entrMdl.entrepriseList[index].streetAddress,
                      );
                    },
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 90),
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(4.0),
                    childAspectRatio: 1.5,
                    children: entrMdl.entrepriseList
                        .map(
                          (item) => EntrepriseCardView(
                            banner: "assets/entreprises/${item.banner}",
                            businessName: item.businessName,
                            streetAddress: item.streetAddress,
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
