import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:aea_app/global/routes.dart';
import 'package:aea_app/models/entreprise.dart';

Future<List<EntrepriseModel>> getEntrepriseList() async {
  // Try to load Data from the Server
  final data = await http.get(Uri.parse(vip000Route));
  Iterable js;

  // If the server returns an OK response, decode it
  if (data.statusCode == 200) {
    js = json.decode(data.body);

    List<EntrepriseModel> entreprises = js.map<EntrepriseModel>((model) {
      return EntrepriseModel.fromJson(model);
    }).toList();

    return entreprises;
  } else {
    throw Exception('Failed to contact the server');
  }
}

Future<List<EntrepriseModel>> getSearchedEntrepriseList(
    String search, String city, int secteur) async {
  // Try to load Data from the Server
  final data = await http.post(Uri.parse(search000Route), body: {'search': search});
  Iterable js;

  // If the server returns an OK response, decode it
  if (data.statusCode == 200) {
    js = json.decode(data.body);

    List<EntrepriseModel> entreprises = js.map<EntrepriseModel>((model) {
      return EntrepriseModel.fromJson(model);
    }).toList();

    return entreprises;
  } else {
    throw Exception('Failed to contact the server');
  }
}
