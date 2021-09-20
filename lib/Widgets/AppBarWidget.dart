import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';

Widget AppBarWidget(String text) {
  return AppBar(
    title: Text(
      text,
      style: TextStyle(
          color: MyThemeData.colorAccent,
          fontSize: 25,
          fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
