class Secteur {
  String pdfid;
  String name;
  String detail;
  String image;

  Secteur({
    required this.pdfid,
    required this.name,
    required this.detail,
    required this.image,
  });

  factory Secteur.fromJson(Map<String, dynamic> json) => Secteur(
        pdfid: json['pdfid'],
        name: json['name'],
        detail: json['detail'],
        image: json['image'],
      );
}
