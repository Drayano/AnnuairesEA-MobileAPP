import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:aea_app/global/styles.dart';

import 'package:aea_app/providers/home_provider.dart';
import 'package:aea_app/providers/entreprise_provider.dart';

import 'package:aea_app/screens/home.dart';
import 'package:aea_app/screens/secteurs/all_secteurs_view.dart';
import 'package:aea_app/screens/entreprises/vip_entreprises_view.dart';
import 'package:aea_app/screens/annuaire_pdf/annuaire_view.dart';

class TabNavigationView extends StatefulWidget {
  const TabNavigationView({
    Key? key,
  }) : super(key: key);

  @override
  State<TabNavigationView> createState() => _TabNavigationView();
}

class _TabNavigationView extends State<TabNavigationView> {
  int _selectedIndex = 0;

  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    final homeModel = Provider.of<HomeProvider>(context, listen: false);
    final entrepriseModel = Provider.of<EntrepriseProvider>(context, listen: false);
    homeModel.getSecteurSuggestionList();
    homeModel.getTopRatedPlacesList();
    homeModel.getSecteursList();
    entrepriseModel.getEntrepriseDataList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[
      const HomePage(key: PageStorageKey('home')),
      const AllSecteursView(key: PageStorageKey('secteurs')),
      const EntrepriseListView(key: PageStorageKey('vip')),
      const AnnuairePDFView(key: PageStorageKey('pdf'))
    ];

    return Scaffold(
      body: PageStorage(
        bucket: _bucket,
        child: children.elementAt(_selectedIndex),
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
            label: "Secteurs",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              child: Icon(
                Icons.star,
                size: 20.0,
              ),
            ),
            label: "VIP",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              child: Icon(
                Icons.menu_book_rounded,
                size: 20.0,
              ),
            ),
            label: "PDF",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kBlue,
        unselectedItemColor: kGrey,
        selectedFontSize: 12,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}
