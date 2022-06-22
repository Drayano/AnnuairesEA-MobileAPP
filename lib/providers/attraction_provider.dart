import 'package:flutter/foundation.dart';
import 'package:aea_app/models/attractions.dart';
import 'package:aea_app/services/attraction_loader.dart';

class AttractionProvider with ChangeNotifier {
  List<AttractionCategory> attractionList = [];

  getAttractionCategoryList() {
    getAttractionData().then(
      (res) {
        attractionList = res;
      },
    );
  }
}
