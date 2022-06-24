class Secteur {
  String pdfid;
  String name;
  String detail;
  String shortDetail;
  String image;

  Secteur({
    required this.pdfid,
    required this.name,
    required this.detail,
    required this.shortDetail,
    required this.image,
  });

  factory Secteur.fromJson(Map<String, dynamic> json) => Secteur(
        pdfid: json['pdfid'],
        name: json['name'],
        detail: json['detail'],
        shortDetail: json['shortDetail'],
        image: json['image'],
      );
}
