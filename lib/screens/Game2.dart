import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/components/TilesForGame2.dart';
import 'package:memory_matrix/screens/Success.dart';

class Game2 extends StatefulWidget {
  Game2(this.list);
  List<TilesForGame2> list;
  @override
  State<Game2> createState() => _Game2State();
}

int score = 0;
int length = 0;

class _Game2State extends State<Game2> {
  @override
  Widget build(BuildContext context) {
    length = 0;
    int n = 36;
    while (n-- > 0) {
      if (widget.list[n].val == 1) {
        length++;
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text('Memory Matrix'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            }),
      ),
      body: SafeArea(
        // create matrix of 3 x 3 buttons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[0]),
                SingleButton(widget.list[1]),
                SingleButton(widget.list[2]),
                SingleButton(widget.list[3]),
                SingleButton(widget.list[4]),
                SingleButton(widget.list[5])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[6]),
                SingleButton(widget.list[7]),
                SingleButton(widget.list[8]),
                SingleButton(widget.list[9]),
                SingleButton(widget.list[10]),
                SingleButton(widget.list[11])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[12]),
                SingleButton(widget.list[13]),
                SingleButton(widget.list[14]),
                SingleButton(widget.list[15]),
                SingleButton(widget.list[16]),
                SingleButton(widget.list[17])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[18]),
                SingleButton(widget.list[19]),
                SingleButton(widget.list[20]),
                SingleButton(widget.list[21]),
                SingleButton(widget.list[22]),
                SingleButton(widget.list[23])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[24]),
                SingleButton(widget.list[25]),
                SingleButton(widget.list[26]),
                SingleButton(widget.list[27]),
                SingleButton(widget.list[28]),
                SingleButton(widget.list[29])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[30]),
                SingleButton(widget.list[31]),
                SingleButton(widget.list[32]),
                SingleButton(widget.list[33]),
                SingleButton(widget.list[34]),
                SingleButton(widget.list[35])
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Score: $score',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleButton extends StatefulWidget {
  SingleButton(this.text);
  TilesForGame2 text;
  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  void ConvertIspressed() {
    setState(() {
      if (widget.text.val == 1) {
        length--;
        if (length == 0) {
          widget.text.addScore();
          if (widget.text.getScore() == 10) {
            widget.text.resetScore();
            Navigator.pushNamed(context, '/success');
            return;
          }
          Navigator.pop(context);
        }
      } else {
        Navigator.pushNamed(context, '/settings');
      }
      widget.text.setIsSelected(!widget.text.getIsSelected());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: widget.text.getIsSelected() ? 4 : 1,
          primary: widget.text.getIsSelected() ? Colors.blue : Colors.white,
        ),
        onPressed: ConvertIspressed,
        child: Text(""),
      ),
    );
  }
}
