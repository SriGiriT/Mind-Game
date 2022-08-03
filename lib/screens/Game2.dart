import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/screens/Success.dart';

class Game2 extends StatefulWidget {
  Game2(this.list);
  List<int> list;
  @override
  State<Game2> createState() => _Game2State();
}

int score = 0;
int length = 0;

class _Game2State extends State<Game2> {
  @override
  Widget build(BuildContext context) {
    int temp = 0;
    while (temp < 36) {
      if (widget.list[temp] == 1) {
        length++;
      }
      temp++;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text('Memory Matrix'),
      ),
      body: SafeArea(
        // create matrix of 3 x 3 buttons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[0], 0, false),
                SingleButton(widget.list[1], 1, false),
                SingleButton(widget.list[2], 2, false),
                SingleButton(widget.list[3], 3, false),
                SingleButton(widget.list[4], 4, false),
                SingleButton(widget.list[5], 5, false)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[6], 6, false),
                SingleButton(widget.list[7], 7, false),
                SingleButton(widget.list[8], 8, false),
                SingleButton(widget.list[9], 9, false),
                SingleButton(widget.list[10], 10, false),
                SingleButton(widget.list[11], 11, false)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[12], 12, false),
                SingleButton(widget.list[13], 13, false),
                SingleButton(widget.list[14], 14, false),
                SingleButton(widget.list[15], 15, false),
                SingleButton(widget.list[16], 16, false),
                SingleButton(widget.list[17], 17, false)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[18], 18, false),
                SingleButton(widget.list[19], 19, false),
                SingleButton(widget.list[20], 20, false),
                SingleButton(widget.list[21], 21, false),
                SingleButton(widget.list[22], 22, false),
                SingleButton(widget.list[23], 23, false)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[24], 24, false),
                SingleButton(widget.list[25], 25, false),
                SingleButton(widget.list[26], 26, false),
                SingleButton(widget.list[27], 27, false),
                SingleButton(widget.list[28], 28, false),
                SingleButton(widget.list[29], 29, false)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[30], 30, false),
                SingleButton(widget.list[31], 31, false),
                SingleButton(widget.list[32], 32, false),
                SingleButton(widget.list[33], 33, false),
                SingleButton(widget.list[34], 34, false),
                SingleButton(widget.list[35], 35, false)
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
  SingleButton(this.text, this.index, this.isPressed);
  int text;
  bool isPressed;
  int index;

  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  void ConvertIspressed() {
    setState(() {
      if (widget.text == 1) {
        length--;
        if (length == 0) {
          score++;
          if (score == 10) {
            score = 0;
            Navigator.pushNamed(context, '/success');
            return;
          }
          Navigator.pop(context);
        }
      } else {
        Navigator.pushNamed(context, '/settings');
      }
      widget.isPressed = !widget.isPressed;
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
          elevation: widget.isPressed ? 4 : 1,
          primary: widget.isPressed ? Colors.blue : Colors.white,
        ),
        onPressed: ConvertIspressed,
        child: Text(""),
      ),
    );
  }
}
