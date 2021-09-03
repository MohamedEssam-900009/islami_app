import 'package:flutter/material.dart';
import 'package:islami_app/SuraDetails/SuraDetailsSreen.dart';

class SuraNameWidget extends StatelessWidget {
  String suraName;
  int position;

  SuraNameWidget(this.suraName, this.position);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemClick(context);
      },
      child: Center(
        child: Text(
          suraName,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  void onItemClick(BuildContext context) {
    //navigate to another screen
    Navigator.of(context).pushNamed(SuraDetailsScreen.ROUTE_NAME,
        arguments: SuraDetailsArgs(filePos: position, suraName: suraName));
  }
}
