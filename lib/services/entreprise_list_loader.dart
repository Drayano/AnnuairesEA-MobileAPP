import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:aea_app/models/entreprise.dart';

Future<List<EntrepriseModel>> getEntrepriseList() async {
  String data = await rootBundle.loadString('assets/data_resources/entreprise.json');
  Iterable js = json.decode(data);
  List<EntrepriseModel> entreprises = js.map<EntrepriseModel>((model) {
    return EntrepriseModel.fromJson(model);
  }).toList();

  return entreprises;
}
