import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Widgets/AppBarWidget.dart';
import 'package:islami_app/Widgets/HadethTitleWidget.dart';

import '../main.dart';

class HadethFragment extends StatefulWidget {
  @override
  _HadethFragmentState createState() => _HadethFragmentState();
}

class _HadethFragmentState extends State<HadethFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarWidget('Ahadeth'),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Image(image: AssetImage('assets/images/hadeth_logo.png'))),
          Expanded(
              flex: 3,
              child: hadethList.length == 0
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return HadethTitleWidget(hadethList[index]);
                      },
                      itemCount: hadethList.length,
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 1,
                          color: MyThemeData.colorPrimary,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                        );
                      },
                    )),
        ],
      ),
    );
  }

  List<Hadeth> hadethList = [];

  void loadHadethFile() async {
    List<Hadeth> list = [];
    String fileContent =
        await rootBundle.loadString('assets/content/ahadeth.txt');
    //line splitter -- \n -- \r\n
    List<String> allHadethContent = fileContent.split('#\r\n');
    for (int i = 0; i < allHadethContent.length; i++) {
      String hadethContent = allHadethContent[i];
      List<String> hadethLines = hadethContent.split('\r\n');
      String title = hadethLines[0];
      String content = '';
      for (int j = 1; j < hadethLines.length; j++) {
        content = content + '' + hadethLines[j];
      }
      Hadeth hadeth = Hadeth(title: title, content: content);
      list.add(hadeth);
    }
    setState(() {
      hadethList = list;
    });
  }
}

class Hadeth {
  String title;
  String content;

  Hadeth({this.title, this.content});
}
