class HotelModel {
  final String name;
  final String image;
  final String detail;
  final String price;
  final String shortDetail;
  final String address;
  final double rating;

  HotelModel(
      {
        required this.name,
        required this.image,
        required this.detail,
        required this.price,
        required this.shortDetail,
        required this.address,
        required this.rating
      }
    );

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
    name: json['name'],
    image: json['image'],
    detail: json['detail'],
    price: json['price'],
    shortDetail: json['shortDetail'],
    address: json['address'],
    rating: json['rating'],
  );
}
