import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:aea_app/global/styles.dart';
import 'package:aea_app/providers/home_provider.dart';
import 'package:aea_app/providers/entreprise_provider.dart';
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
          useMaterial3: true,
          primarySwatch: materialPrimaryColor,
          appBarTheme: const AppBarTheme(
            color: appbarThemeColor,
          ),
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: 'Lato',
        ),
        home: const TabNavigationView(),
      ),
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
  ChangeNotifierProvider<EntrepriseProvider>(create: (_) => EntrepriseProvider()),
];
