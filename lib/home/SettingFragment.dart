import 'package:flutter/material.dart';
import 'package:islami_app/Widgets/AppBarWidget.dart';

class SettingFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarWidget('Settings'),
      body: Container(
        child: Text('Settings'),
      ),
    );
  }
}
