import 'package:flutter/material.dart';
import 'package:islami_app/view/hadeth/screen/hadeth_details_screen.dart';
import 'package:islami_app/view/hadeth/screen/hadeth_fragment.dart';


// ignore: must_be_immutable
class HadethTitleWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
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
