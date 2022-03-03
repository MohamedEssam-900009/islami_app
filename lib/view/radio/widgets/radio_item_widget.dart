import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';
import 'package:islami_app/models/radio_response.dart';

// ignore: must_be_immutable
class RadioItem extends StatefulWidget {
  Radios item;
  Function play, stop;
  RadioItem({Key key, this.item, this.play, this.stop}) : super(key: key);

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
