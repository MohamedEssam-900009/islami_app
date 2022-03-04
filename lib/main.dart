import 'package:flutter/material.dart';
import 'package:islami_app/view/hadeth/screen/hadeth_details_screen.dart';
import 'package:islami_app/view/home/home_screen.dart';
import 'package:islami_app/view/quran/widgets/sura_details_sreen.dart';
import 'package:islami_app/view/radio/screen/radio_fragment.dart';

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
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        RadioFragment.routeName:(context)=>RadioFragment()
      
      },
      initialRoute: HomeScreen.routeName,
      theme: ThemeData(
        primaryColor: MyThemeData.colorPrimary,
        accentColor: MyThemeData.colorAccent,
      ),
    );
  }
}
