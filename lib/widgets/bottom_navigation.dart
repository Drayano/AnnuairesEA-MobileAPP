import 'package:flutter/material.dart';
import 'package:aea_app/global/styles.dart';

Widget bottomNavigation(int selectedIndex, Function onItemTapped) {
  return BottomNavigationBar(
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
              Icons.account_circle,
              size: 20.0,
            ),
          ),
          label: "Profile",
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
      currentIndex: selectedIndex,
      selectedItemColor: kBlue,
      unselectedItemColor: kGrey,
      selectedFontSize: 12,
      // onTap: onItemTapped,
      backgroundColor: Colors.white,
      elevation: 18,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true);
}
