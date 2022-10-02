class Secteur {
  String pdfid;
  String name;
  String detail;
  String image;
  String imageThumb;

  Secteur({
    required this.pdfid,
    required this.name,
    required this.detail,
    required this.image,
    required this.imageThumb,
  });

  factory Secteur.fromJson(Map<String, dynamic> json) => Secteur(
      pdfid: json['pdfid'],
      name: json['name'],
      detail: json['detail'],
      image: json['image'],
      imageThumb: json['image_thumb']);
}
