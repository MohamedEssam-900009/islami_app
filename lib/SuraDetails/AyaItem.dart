import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AyaWidget extends StatelessWidget {
  String aya;
  int position;
  AyaWidget(this.aya, this.position);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text(
          aya + ' ($position)',
          style: TextStyle(fontSize: 24),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
