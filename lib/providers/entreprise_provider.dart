import 'package:flutter/foundation.dart';

import 'package:aea_app/models/entreprise.dart';
import 'package:aea_app/services/entreprise_list_loader.dart';

class EntrepriseProvider with ChangeNotifier {
  List<EntrepriseModel> entrepriseList = [];

  getEntrepriseDataList() async {
    await getEntrepriseList().then(
      (res) {
        entrepriseList = res;
      },
    );
    notifyListeners();
  }
}
