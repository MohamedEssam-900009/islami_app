import 'package:flutter/material.dart';
import 'package:islami_app/Widgets/AppBarWidget.dart';

class RadioFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarWidget('Radio'),
      body: Container(
        child: Text('Radio'),
      ),
    );
  }
}
