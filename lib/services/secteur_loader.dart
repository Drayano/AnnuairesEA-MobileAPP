import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:aea_app/global/routes.dart';
import 'package:aea_app/models/secteurs.dart';

Future<List<Secteur>> getSecteurData() async {
  String data =
      await rootBundle.loadString('${assetsDataresDir}secteursData.json');
  Iterable js = json.decode(data);
  List<Secteur> secteurs = js.map<Secteur>((model) {
    return Secteur.fromJson(model);
  }).toList();

  return secteurs;
}

Future<List<Secteur>> getSuggestionsData() async {
  String data =
      await rootBundle.loadString('${assetsDataresDir}suggestions.json');
  Iterable js = json.decode(data);
  List<Secteur> secteurs = js.map<Secteur>((model) {
    return Secteur.fromJson(model);
  }).toList();

  return secteurs;
}

Future<List<Secteur>> getTopRatedData() async {
  String data =
      await rootBundle.loadString('${assetsDataresDir}topRatedPlaces.json');
  Iterable js = json.decode(data);
  List<Secteur> secteurs = js.map<Secteur>((model) {
    return Secteur.fromJson(model);
  }).toList();

  return secteurs;
}

Future<List<Secteur>> getSecteursData() async {
  String data =
      await rootBundle.loadString('${assetsDataresDir}secteurs.json');
  Iterable js = json.decode(data);
  List<Secteur> secteurs = js.map<Secteur>((model) {
    return Secteur.fromJson(model);
  }).toList();

  return secteurs;
}
