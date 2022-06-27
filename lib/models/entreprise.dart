class EntrepriseModel {
  final String name;
  final String image;
  final String detail;
  final String price;
  final String shortDetail;
  final String address;
  final double rating;

  EntrepriseModel({
    required this.name,
    required this.image,
    required this.detail,
    required this.price,
    required this.shortDetail,
    required this.address,
    required this.rating,
  });

  factory EntrepriseModel.fromJson(Map<String, dynamic> json) => EntrepriseModel(
        name: json['name'],
        image: json['image'],
        detail: json['detail'],
        price: json['price'],
        shortDetail: json['shortDetail'],
        address: json['address'],
        rating: json['rating'],
      );
}
