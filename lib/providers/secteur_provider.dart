import 'package:flutter/foundation.dart';

import 'package:aea_app/models/secteurs.dart';
import 'package:aea_app/services/secteur_loader.dart';

class SecteurProvider with ChangeNotifier {
  List<SecteurCategory> secteurList = [];

  getSecteurCategoryList() {
    getSecteurData().then(
      (res) {
        secteurList = res;
      },
    );
  }
}
