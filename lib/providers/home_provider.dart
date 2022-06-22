import 'package:flutter/foundation.dart';
import 'package:aea_app/models/attractions.dart';
import 'package:aea_app/services/attraction_loader.dart';

class HomeProvider with ChangeNotifier {
  List<Attraction> suggestionList = [];
  List<Attraction> topRatedPlaces = [];

  getAttractionSuggestionList() async {
    await getSuggestionsData().then((res) {
      suggestionList = res;
    });
    notifyListeners();
  }

  getTopRatedPlacesList() async {
    await getTopRatedData().then((res) {
      topRatedPlaces = res;
    });
    notifyListeners();
  }
}
