import 'package:flutter/material.dart';
import 'package:islami_app/HadethDetails/HadethDetailsScreen.dart';
import 'package:islami_app/SuraDetails/SuraDetailsSreen.dart';
import 'package:islami_app/home/HadethFragment.dart';

class HadethTitleWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.ROUTE_NAME, arguments: hadeth);
      },
      child: Center(
        child: Text(
          hadeth.title,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
