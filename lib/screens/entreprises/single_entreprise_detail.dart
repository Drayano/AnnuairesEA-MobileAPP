import 'package:flutter/material.dart';

class SingleEntrepriseDetail extends StatefulWidget {
  final String id;
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

  const SingleEntrepriseDetail({
    Key? key,
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
  }) : super(key: key);

  @override
  State<SingleEntrepriseDetail> createState() => _SingleEntrepriseDetailState();
}

class _SingleEntrepriseDetailState extends State<SingleEntrepriseDetail> {
  bool isFavourite = false;

  _addToFavourite() {
    setState(
      () {
        isFavourite = !isFavourite;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    bool companyPresentation = widget.companyPresentation != null;
    bool servicePhoto = widget.servicePhoto1 != null;
    bool banner = widget.banner != null;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height / 2,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(60.0),
                ),
                image: DecorationImage(
                  image: servicePhoto ? AssetImage(widget.servicePhoto1!) : banner ? AssetImage(widget.banner!) : const AssetImage(""),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Text(
                          widget.businessName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(74, 74, 74, .9),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: IconButton(
                          icon: Icon(
                            isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: _addToFavourite,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    companyPresentation ? widget.companyPresentation! : "",
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.6,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
