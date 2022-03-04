import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';
import 'package:islami_app/models/radio_response.dart';

// ignore: must_be_immutable
class RadioItem extends StatefulWidget {
  late Radios item;
  late Function play, stop;
  RadioItem({Key? key,required this.item,required this.play,required this.stop}) : super(key: key);

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            '${widget.item.name}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  widget.play(widget.item.radioUrl);
                },
                icon: Icon(
                  Icons.play_arrow,
                  color: MyThemeData.colorPrimary,
                  size: 50,
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.stop();
                },
                icon: Icon(
                  Icons.pause,
                  color: MyThemeData.colorPrimary,
                  size: 50,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
