import 'package:flutter/material.dart';
import 'package:islami_app/SuraDetails/SuraDetailsSreen.dart';
import 'package:islami_app/home/HomeScreen.dart';

void main() {
  runApp(MyApplication());
}

class MyThemeData {
  static var colorPrimary = Color.fromRGBO(183, 147, 95, 1.0);
  static var colorAccent = Color.fromRGBO(36, 36, 36, 1.0);
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
        SuraDetailsScreen.ROUTE_NAME: (context) => SuraDetailsScreen()
      },
      initialRoute: HomeScreen.ROUTE_NAME,
      theme: ThemeData(
        primaryColor: MyThemeData.colorPrimary,
        accentColor: MyThemeData.colorAccent,
      ),
    );
  }
}
