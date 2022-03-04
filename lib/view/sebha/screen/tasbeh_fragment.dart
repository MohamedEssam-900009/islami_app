import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';
import 'dart:math' as Math;

import 'package:islami_app/widgets/app_bar_widget.dart';

class TasbehFragment extends StatefulWidget {
  @override
  _TasbehFragmentState createState() => _TasbehFragmentState();
}

class _TasbehFragmentState extends State<TasbehFragment> {
  int counter = 0;
  int currentTasbeh = 0;
  int angle = 0;
  List<String> tasbehList = ['الله اكبر', 'سبحان الله', 'الحمد لله'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBarWidget('Tasabeh'),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    InkWell(
                      onTap: onSebhaPressed,
                      child: Transform.rotate(
                        angle: Math.pi / 180 * angle,
                        child: Container(
                          child: Image(
                            image:
                                AssetImage('assets/images/body_of_sebha.png'),
                            height: 190,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 55),
                    child: Image(
                        image: AssetImage('assets/images/head_of_sebha.png'))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'عدد التسبيحات',
              style: TextStyle(fontSize: 25, color: MyThemeData.colorAccent),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(200, 179, 150, 1.0),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            padding: EdgeInsets.all(24),
            child: Text(
              '$counter',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: MyThemeData.colorPrimary,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Text(
              tasbehList[currentTasbeh],
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void onSebhaPressed() {
    setState(
      () {
        counter++;
        angle += 20;
        if (counter % 33 == 0) {
          counter = 0;
          if (currentTasbeh == 2) {
            currentTasbeh = 0;
          } else
            currentTasbeh += 1;
        }
      },
    );
  }
}
