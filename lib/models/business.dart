import 'dart:convert';

import 'package:aea_app/models/entreprise.dart';

EntrepriseModel entrepriseModelFromJson(String str) =>
EntrepriseModel.fromJson(json.decode(str));

BusinessModel businessModelFromJson(String str) => BusinessModel.fromJson(json.decode(str));

String businessModelToJson(BusinessModel data) => json.encode(data.toJson());

class BusinessModel {
  BusinessModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
  });

  int currentPage;
  List<EntrepriseModel> data;
  String firstPageUrl;
  int from;
  String? nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        currentPage: json["current_page"],
        data: List<EntrepriseModel>.from(
          json["data"].map((x) => EntrepriseModel.fromJson(x)),
        ),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
      };
}