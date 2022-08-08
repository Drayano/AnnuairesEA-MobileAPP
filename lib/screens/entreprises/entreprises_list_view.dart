import 'package:aea_app/models/entreprise.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/global/routes.dart';
import 'package:aea_app/providers/entreprise_provider.dart';
import 'package:aea_app/widgets/entreprise/entreprise_card_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class EntrepriseListView extends StatefulWidget {
  String search;

  EntrepriseListView({Key? key, required this.search,}) : super(key: key);

  @override
  // State<EntrepriseListView> createState() => _EntrepriseListViewState();
  _EntrepriseListViewState createState() => _EntrepriseListViewState();
}

class _EntrepriseListViewState extends State<EntrepriseListView> {
  _EntrepriseListViewState();

  int currentPage = 1;
  late int totalPages;
  late int to;
  late int perPage;
  late String? nextPage;
  // String search = "oxygen";
  
  List<EntrepriseModel> businesses = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  

  @override
  Widget build(BuildContext context) {
    Future<bool> getSearchedEntreprises({bool isRefreshed = false}) async {
    if (isRefreshed) {
      currentPage = 1;
    } else {
      if (nextPage == null) {
        refreshController.loadNoData();
        return false;
      }
    }

    print("\n\n\n TEST");
    print(widget.search);
    final Uri uri = Uri.parse("https://aea-backend.000webhostapp.com/search?page=$currentPage");
    // final Uri uri = Uri.parse("https://aea-backend.000webhostapp.com/search");
    final response = await http.post(uri, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'}, body: '{"search": "${widget.search}"}');

    if (response.statusCode == 200) {
      print("Code 200 OK");
      print(widget.search);
      final result = businessModelFromJson(response.body);

      if (isRefreshed) {
        businesses = result.data;
      } else {
        businesses.addAll(result.data);
      }

      currentPage++;
      to = result.to;
      perPage = result.perPage;
      nextPage = result.nextPageUrl;
      totalPages = 2; //****************************** */

      setState(() {});
      return true;
    } else {
      print("Code ERREUR");
      print(response.body);
      return false;
    }
  }


    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: Stack(
        children: [
          isPortrait
              ? Container(
                  margin: const EdgeInsets.only(top: 75),
                  child: SmartRefresher(
                    controller: refreshController,
                    enablePullUp: true,
                    onRefresh: () async {
                      final result =
                          await getSearchedEntreprises(isRefreshed: true);
                      if (result) {
                        refreshController.refreshCompleted();
                      } else {
                        refreshController.refreshCompleted();
                      }
                    },
                    onLoading: () async {
                      final result = await getSearchedEntreprises();
                      if (result) {
                        refreshController.loadComplete();
                      } else {
                        refreshController.loadFailed();
                      }
                    },
                    child: ListView.builder(
                      itemCount: businesses.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final entreprise = businesses[index];
                        return EntrepriseCardView(
                          id: index,
                          businessName: entreprise.businessName,
                          streetAddress: entreprise.streetAddress,
                          banner: "$bannerRoute${entreprise.banner}",
                        );
                      },
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 120),
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(4.0),
                    childAspectRatio: 1.45,
                    children: businesses.map(
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
