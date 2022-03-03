import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/main.dart';
import 'package:islami_app/models/radio_response.dart';
import 'package:islami_app/view/radio/widgets/radio_item_widget.dart';
import 'package:islami_app/widgets/app_bar_widget.dart';

class RadioFragment extends StatefulWidget {
  @override
  State<RadioFragment> createState() => _RadioFragmentState();
}

class _RadioFragmentState extends State<RadioFragment> {
  Future<RadioResponse> radioResponse;
  AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    radioResponse = fetchRadios();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioResponse>(
      future: radioResponse,
      builder: (buildContext, snapShot) {
        if (snapShot.hasData) {
          return Column(
            children: [
              appBarWidget('Radio'),
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/radio.png',
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .3,
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapShot.data.radios.length,
                  itemBuilder: (context, index) {
                    return RadioItem(
                      item: snapShot.data.radios[index],
                      play: play,
                      stop: stop,
                    );
                  },
                ),
              )
            ],
          );
        } else if (snapShot.hasError) {
          return Center(
            child: IconButton(
              icon: Icon(
                Icons.refresh,
                color: MyThemeData.colorPrimary,
              ),
              onPressed: () {
                radioResponse = fetchRadios();
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<RadioResponse> fetchRadios() async {
    final response = await http
        .get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));
    if (response.statusCode == 200) {
      return RadioResponse.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception(response.body);
    }
  }

  play(String url) async {
    int result = await audioPlayer.play(url);
  }

  stop() async {
    await audioPlayer.stop();
  }
}
