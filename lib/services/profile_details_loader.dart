import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:aea_app/models/attractions.dart';

Future<List<Attraction>> getFavouriteData() async {
  String data =
      await rootBundle.loadString('assets/data_resources/favourite.json');
  Iterable js = json.decode(data);
  List<Attraction> attractions = js.map<Attraction>((model) {
    return Attraction.fromJson(model);
  }).toList();

  return attractions;
}

Future<List<Attraction>> getVisitedData() async {
  String data =
      await rootBundle.loadString('assets/data_resources/visited.json');
  Iterable js = json.decode(data);
  List<Attraction> attractions = js.map<Attraction>((model) {
    return Attraction.fromJson(model);
  }).toList();

  return attractions;
}
