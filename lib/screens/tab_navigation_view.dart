import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aea_app/providers/attraction_provider.dart';
import 'package:aea_app/providers/home_provider.dart';
import 'package:aea_app/providers/hotel_provider.dart';
import 'package:aea_app/screens/home.dart';
import 'package:aea_app/screens/places/all_attractions_view.dart';
import 'package:aea_app/global/styles.dart';

import 'hotels/near_by_hotels.dart';

class TabNavigationView extends StatefulWidget {
  const TabNavigationView({
    Key? key,
  }) : super(key: key);

  @override
  _TabNavigationView createState() => _TabNavigationView();
}

class _TabNavigationView extends State<TabNavigationView> {
  int _selectedIndex = 0;

  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    final homeMdl = Provider.of<HomeProvider>(context, listen: false);
    final attrMdl = Provider.of<AttractionProvider>(context, listen: false);
    final htMdl = Provider.of<HotelProvider>(context, listen: false);
    attrMdl.getAttractionCategoryList();
    homeMdl.getAttractionSuggestionList();
    homeMdl.getTopRatedPlacesList();
    htMdl.getHotelDataList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = <Widget>[
      HomePage(key: const PageStorageKey('home')),
      AllAttractionsView(key: const PageStorageKey('attractions')),
      HotelListView(key: const PageStorageKey('hotels'))
    ];

    return Scaffold(
      body: PageStorage(
        bucket: _bucket,
        child: _children.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              child: Icon(
                Icons.home,
                size: 20.0,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              child: Icon(
                Icons.place,
                size: 20.0,
              ),
            ),
            label: "Attractions",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              child: Icon(
                Icons.hotel,
                size: 20.0,
              ),
            ),
            label: "Hotels",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kBlue,
        unselectedItemColor: kGrey,
        selectedFontSize: 12,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 18,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}