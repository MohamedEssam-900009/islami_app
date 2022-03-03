import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';

Widget appBarWidget(String text) {
  return AppBar(
    title: Text(
      text,
      style: TextStyle(
        color: MyThemeData.colorAccent,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
