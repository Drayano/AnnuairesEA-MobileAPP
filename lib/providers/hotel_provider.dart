import 'package:flutter/foundation.dart';
import 'package:aea_app/models/hotel.dart';
import 'package:aea_app/services/hotel_list_loader.dart';

class HotelProvider with ChangeNotifier {
  List<HotelModel> hotelList = [];

  getHotelDataList() async {
    await getHotelList().then((res) {
      hotelList = res;
    });
    notifyListeners();
  }
}
