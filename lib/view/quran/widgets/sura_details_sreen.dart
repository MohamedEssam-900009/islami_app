import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:islami_app/main.dart';
import 'package:islami_app/view/quran/widgets/aya_item.dart';

class SuraDetailsScreen extends StatefulWidget {
  static final String routeName = 'sura_details';

  @override
  _SuraDetailsScreenState createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    readSuraContent('assets/content/${args.filePos}.txt');
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/default_bg.png'))),
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                args.suraName,
                style: TextStyle(color: MyThemeData.colorAccent, fontSize: 24),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: MyThemeData.colorAccent),
            ),
            backgroundColor: Colors.transparent,
            body: getMainView()),
      ),
    );
  }

  Widget getMainView() {
    return Container(
      child: ayatList.length == 0
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(top: 25, right: 14, left: 14),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(248, 248, 248, .7),
                  borderRadius: BorderRadius.circular(8)),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return AyaWidget(ayatList[index], index + 1);
                },
                itemCount: ayatList.length,
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    color: MyThemeData.colorPrimary,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                  );
                },
              ),
            ),
    );
  }

  List<String> ayatList = [];

  void readSuraContent(String fileName) async {
    String fileContent = await rootBundle.loadString(fileName);
    List<String> lines = fileContent.split('\n');
    setState(() {
      ayatList = lines;
    });
  }
}

class SuraDetailsArgs {
  late int filePos;
  late String suraName;

  SuraDetailsArgs({
    required this.filePos,
    required this.suraName,
  });
}
