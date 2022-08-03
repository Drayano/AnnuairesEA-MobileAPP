import 'dart:convert';

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
  dynamic? prevPageUrl;
  int to;

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        currentPage: json["current_page"],
        data: List<EntrepriseModel>.from(
            json["data"].map((x) => EntrepriseModel.fromJson(x))),
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

class EntrepriseModel {
  final int id;
  final String businessName;
  final String streetAddress;
  final String? state;
  final String? fixePhone;
  final String? faxNumber;
  final String? mobile;
  final String? email;
  final String? website;
  final String? categories;
  final String? logo;
  final String? city;
  final String? description;
  final String? contactName;
  final String? businessTitle;
  final String? customerType;
  final String? keywords;
  final String? generalInfo;
  final String advertisementStatut;
  final String? latitude;
  final String? longitude;
  final String? createdBy;
  final String? createdDate;
  final String statut;
  final String? companyPresentation;
  final String? yearEstablished;
  final String? servicePhoto1;
  final String? servicePhoto2;
  final String? servicePhoto3;
  final String? servicePhoto4;
  final String? servicePhoto5;
  final String? servicePhoto6;
  final String? documentationsCatalogs;
  final String? companyReferences;
  final String? videoEntreprise;
  final String? companyHistory;
  final String? companyActivities;
  final String? facebook;
  final String? youtube;
  final String? maps;
  final String? banner;
  final String? addDate;

  EntrepriseModel({
    required this.id,
    required this.businessName,
    required this.streetAddress,
    this.state,
    this.fixePhone,
    this.faxNumber,
    this.mobile,
    this.email,
    this.website,
    this.categories,
    this.logo,
    this.city,
    this.description,
    this.contactName,
    this.businessTitle,
    this.customerType,
    this.keywords,
    this.generalInfo,
    required this.advertisementStatut,
    this.latitude,
    this.longitude,
    this.createdBy,
    this.createdDate,
    required this.statut,
    this.companyPresentation,
    this.yearEstablished,
    this.servicePhoto1,
    this.servicePhoto2,
    this.servicePhoto3,
    this.servicePhoto4,
    this.servicePhoto5,
    this.servicePhoto6,
    this.documentationsCatalogs,
    this.companyReferences,
    this.videoEntreprise,
    this.companyHistory,
    this.companyActivities,
    this.facebook,
    this.youtube,
    this.maps,
    this.banner,
    this.addDate,
  });

  factory EntrepriseModel.fromJson(Map<String, dynamic> json) =>
      EntrepriseModel(
        id: json['id'],
        businessName: json['business_name'],
        streetAddress: json['street_address'],
        state: json['state'],
        fixePhone: json['fixe_phone'],
        faxNumber: json['fax_number'],
        mobile: json['mobile'],
        email: json['email'],
        website: json['website'],
        categories: json['categories'],
        logo: json['logo'],
        city: json['city'],
        description: json['description'],
        contactName: json['contact_name'],
        businessTitle: json['business_title'],
        customerType: json['custmer_type'],
        keywords: json['key_words'],
        generalInfo: json['general_info'],
        advertisementStatut: json['advertisement_statut'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        createdBy: json['created_by'],
        createdDate: json['created_date'],
        statut: json['statut'],
        companyPresentation: json['company_presentation'],
        yearEstablished: json['year_established'],
        servicePhoto1: json['service_photo_1'],
        servicePhoto2: json['service_photo_2'],
        servicePhoto3: json['service_photo_3'],
        servicePhoto4: json['service_photo_4'],
        servicePhoto5: json['service_photo_5'],
        servicePhoto6: json['service_photo_6'],
        documentationsCatalogs: json['documentations_catalogs'],
        companyReferences: json['company_references'],
        videoEntreprise: json['video_entreprise'],
        companyHistory: json['company_history'],
        companyActivities: json['company_activities'],
        facebook: json['facebook'],
        youtube: json['youtube'],
        maps: json['maps'],
        banner: json['banner'],
        addDate: json['add_date'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_name": businessName,
        "street_address": streetAddress,
        "state": state,
        "fixe_phone": fixePhone,
        "fax_number": faxNumber,
        "mobile": mobile,
        "email": email,
        "website": website,
        "categories": categories,
        "logo": logo,
        "city": city,
        "description": description == null ? null : description,
        "contact_name": contactName,
        "business_title": businessTitle,
        "custmer_type": customerType,
        "key_words": keywords,
        "general_info": generalInfo,
        "advertisement_statut": advertisementStatut,
        "latitude": latitude,
        "longitude": longitude,
        "created_by": createdBy,
        "created_date": createdDate,
        "statut": statut,
        "company_presentation": companyPresentation,
        "year_established": yearEstablished,
        "service_photo_1": servicePhoto1,
        "service_photo_2": servicePhoto2,
        "service_photo_3": servicePhoto3,
        "service_photo_4": servicePhoto4,
        "service_photo_5": servicePhoto5,
        "service_photo_6": servicePhoto6,
        "documentations_catalogs": documentationsCatalogs,
        "company_references": companyReferences,
        "video_entreprise": videoEntreprise,
        "company_history": companyHistory,
        "company_activities": companyActivities,
        "facebook": facebook,
        "youtube": youtube,
        "maps": maps,
        "banner": banner,
        "add_date": addDate,
      };
}

// enum CompanyReferences { EMPTY, COMPANY_REFERENCES }

// final companyReferencesValues = EnumValues(
//     {"": CompanyReferences.COMPANY_REFERENCES, " ": CompanyReferences.EMPTY});

// enum ContactName { EMPTY, CHAILA_CHEKAIK_HAKIM }

// final contactNameValues = EnumValues({
//   "CHAILA CHEKAIK Hakim": ContactName.CHAILA_CHEKAIK_HAKIM,
//   "": ContactName.EMPTY
// });

// enum CustmerType { VIP }

// final custmerTypeValues = EnumValues({"vip": CustmerType.VIP});

// enum Facebook {
//   WWW_FACEBOOK_COM_CHIALI_GROUPE,
//   EMPTY,
//   WWW_FACEBOOK_COM_CABLERIEALGERIENNE
// }

// final facebookValues = EnumValues({
//   "": Facebook.EMPTY,
//   "www.facebook.com/cableriealgerienne":
//       Facebook.WWW_FACEBOOK_COM_CABLERIEALGERIENNE,
//   "www.facebook.com/chiali.groupe": Facebook.WWW_FACEBOOK_COM_CHIALI_GROUPE
// });

// enum GeneralInfo { EMPTY, SOCIET_IMPORT_EXPORT }

// final generalInfoValues = EnumValues({
//   "": GeneralInfo.EMPTY,
//   "societé import export": GeneralInfo.SOCIET_IMPORT_EXPORT
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
