import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:aea_app/providers/secteur_provider.dart';
import 'package:aea_app/providers/home_provider.dart';
import 'package:aea_app/providers/hotel_provider.dart';

import 'package:aea_app/screens/tab_navigation_view.dart';

void main() => runApp(const TravelApp());

class TravelApp extends StatelessWidget {
  const TravelApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(41, 182, 246, 1),
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Lato',
        ),
        home: const TabNavigationView(),
      ),
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
  ChangeNotifierProvider<SecteurProvider>(
    create: (_) => SecteurProvider(),
  ),
  ChangeNotifierProvider<HotelProvider>(create: (_) => HotelProvider()),
];
