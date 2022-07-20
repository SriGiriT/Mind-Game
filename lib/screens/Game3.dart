import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/screens/Success.dart';

class Game3 extends StatefulWidget {
  Game3(this.list);
  List<int> list;

  @override
  State<Game3> createState() => _Game3State();
}

int count = 1;
int score = 0;

class _Game3State extends State<Game3> {
  @override
  Widget build(BuildContext context) {
    count = 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text('Ascending Numbers'),
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[3], 3, false),
                SingleButton(widget.list[4], 4, false),
                SingleButton(widget.list[5], 5, false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(widget.list[6], 6, false),
                SingleButton(widget.list[7], 7, false),
                SingleButton(widget.list[8], 8, false)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Score: $score',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto'),
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
      if (widget.text == count) {
        print(count);
        print(score);
        if (score == 7) {
          score = 0;
          Navigator.pushNamed(context, '/success');
          return;
        }
        if (count == score + 3) {
          score++;
          Navigator.pop(context);
        }
      } else {
        Navigator.pushNamed(context, '/settings');
      }
      count++;
      widget.isPressed = !widget.isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          child: widget.isPressed
              ? Center(
                  child: Text(
                  widget.text.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ))
              : Text(""),
        ),
      ),
    );
    // SizedBox(
    // child:
    // RaisedButton(
    //   onPressed: () {
    //     ConvertIspressed();
    //   },
    //   child: widget.isPressed
    //       ? Text(
    //           widget.text.toString(),
    //           style: TextStyle(fontSize: 20),
    //         )
    //       : Text(
    //           "",
    //         ),
    //   color: widget.isPressed ? Colors.white : Colors.white70,
    //   textColor: widget.isPressed ? Colors.white70 : Colors.white,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    // ),
    // ),
    // RaisedButton(
    //   color: widget.isPressed ? Colors.white : Colors.white70,
    //   onPressed: ConvertIspressed,
    //   child: widget.isPressed ? Text(widget.text.toString()) : Text(""),
  }
}

/*
RaisedButton(
        color: widget.isPressed ? Colors.white : Colors.white70,
        onPressed: ConvertIspressed,
        child: widget.isPressed ? Text(widget.text.toString()) : Text(""),
      ),
      */
