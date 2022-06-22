import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:aea_app/models/attractions.dart';

Future<List<AttractionCategory>> getAttractionData() async {
  String data =
      await rootBundle.loadString('assets/data_resources/attractionsData.json');
  Iterable js = json.decode(data);
  List<AttractionCategory> attractions = js.map<AttractionCategory>((model) {
    return AttractionCategory.fromJson(model);
  }).toList();

  return attractions;
}

Future<List<Attraction>> getSuggestionsData() async {
  String data =
      await rootBundle.loadString('assets/data_resources/suggestions.json');
  Iterable js = json.decode(data);
  List<Attraction> attractions = js.map<Attraction>((model) {
    return Attraction.fromJson(model);
  }).toList();

  return attractions;
}

Future<List<Attraction>> getTopRatedData() async {
  String data =
      await rootBundle.loadString('assets/data_resources/topRatedPlaces.json');
  Iterable js = json.decode(data);
  List<Attraction> attractions = js.map<Attraction>((model) {
    return Attraction.fromJson(model);
  }).toList();

  return attractions;
}
