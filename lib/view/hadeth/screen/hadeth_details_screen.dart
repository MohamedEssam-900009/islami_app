import 'package:flutter/material.dart';
import 'package:islami_app/view/hadeth/screen/hadeth_fragment.dart';

import '../../../main.dart';

class HadethDetailsScreen extends StatelessWidget {
  static final String routeName = 'hadeth_details';

  @override
  Widget build(BuildContext context) {
    var hadethArgs = ModalRoute.of(context).settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/default_bg.png'))),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              hadethArgs.title,
              style: TextStyle(color: MyThemeData.colorAccent, fontSize: 24),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: MyThemeData.colorAccent),
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25, right: 14, left: 14),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(248, 248, 248, .7),
                    borderRadius: BorderRadius.circular(8)),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, right: 14, left: 14),
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    hadethArgs.content,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
