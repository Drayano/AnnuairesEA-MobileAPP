import 'package:flutter/foundation.dart';

import 'package:aea_app/models/secteurs.dart';
import 'package:aea_app/services/secteur_loader.dart';

class HomeProvider with ChangeNotifier {
  List<Secteur> suggestionList = [];
  List<Secteur> topRatedPlaces = [];
  List<Secteur> secteurs = [];

  getSecteurSuggestionList() async {
    await getSuggestionsData().then(
      (res) {
        suggestionList = res;
      },
    );
    notifyListeners();
  }

  getTopRatedPlacesList() async {
    await getTopRatedData().then(
      (res) {
        topRatedPlaces = res;
      },
    );
    notifyListeners();
  }

  getSecteursList() async {
    await getSecteursData().then(
      (res) {
        secteurs = res;
      },
    );
    notifyListeners();
  }
}
