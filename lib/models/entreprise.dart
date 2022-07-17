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
}
