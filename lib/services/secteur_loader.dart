import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:aea_app/models/secteurs.dart';

Future<List<SecteurCategory>> getSecteurData() async {
  String data =
      await rootBundle.loadString('assets/data_resources/secteursData.json');
  Iterable js = json.decode(data);
  List<SecteurCategory> secteurs = js.map<SecteurCategory>((model) {
    return SecteurCategory.fromJson(model);
  }).toList();

  return secteurs;
}

Future<List<Secteur>> getSuggestionsData() async {
  String data =
      await rootBundle.loadString('assets/data_resources/suggestions.json');
  Iterable js = json.decode(data);
  List<Secteur> secteurs = js.map<Secteur>((model) {
    return Secteur.fromJson(model);
  }).toList();

  return secteurs;
}

Future<List<Secteur>> getTopRatedData() async {
  String data =
      await rootBundle.loadString('assets/data_resources/topRatedPlaces.json');
  Iterable js = json.decode(data);
  List<Secteur> secteurs = js.map<Secteur>((model) {
    return Secteur.fromJson(model);
  }).toList();

  return secteurs;
}

Future<List<Secteur>> getSecteursData() async {
  String data =
      await rootBundle.loadString('assets/data_resources/secteurs.json');
  Iterable js = json.decode(data);
  List<Secteur> secteurs = js.map<Secteur>((model) {
    return Secteur.fromJson(model);
  }).toList();

  return secteurs;
}