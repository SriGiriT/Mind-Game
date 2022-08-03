import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/screens/Game55.dart';
import 'package:memory_matrix/screens/Settings_screen.dart';
import 'package:memory_matrix/screens/Success.dart';

class Game5 extends StatefulWidget {
  Game5(this.list);
  List<IconData> list;
  @override
  State<Game5> createState() => _Game5State();
}

IconData icon = Icons.close;
int score = 0;
int length = 0;
int count = 0;
int tryy = 10;

class _Game5State extends State<Game5> {
  @override
  Widget build(BuildContext context) {
    count = 0;
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[4], 4, false),
                SingleButton(widget.list[5], 5, false),
                SingleButton(widget.list[6], 6, false),
                SingleButton(widget.list[7], 7, false)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                SingleButton(widget.list[15], 15, false)
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
  IconData text;
  bool isPressed;
  int index;

  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  void ConvertIspressed() {
    setState(() {
      if (icon == Icons.close) {
        icon = widget.text;
        widget.isPressed = !widget.isPressed;
      } else if (icon == widget.text) {
        icon = Icons.close;
        widget.isPressed = !widget.isPressed;
        count++;
        if (count == 8) {
          score++;
          if (score == 10) {
            score = 0;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Success(),
              ),
            );
            return;
          }
          Navigator.pop(context);
        }
      } else {
        tryy--;
        if (tryy == 0) {
          tryy = 10;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MySettings(),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: ConvertIspressed,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.white,
          child: Center(
            child: widget.isPressed
                ? Icon(
                    widget.text,
                    size: 30,
                    color: Colors.black,
                  )
                : Text(""),
          ),
        ),
      ),
    );
  }
}
