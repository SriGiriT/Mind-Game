import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/screens/Success.dart';

class Game4 extends StatefulWidget {
  Game4(this.list);
  List<int> list;

  @override
  State<Game4> createState() => _Game4State();
}

int count = 1;
int score = 0;

class _Game4State extends State<Game4> {
  @override
  Widget build(BuildContext context) {
    count = 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text('Memory'),
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
        count++;
        if (count == 10) {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
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
    );
  }
}

// @override

//  widget.isPressed ? Colors.white : Colors.white70
//  widget.isPressed ? Text(widget.text.toString()) : Text("")



//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         height: 60,
//         width: 60,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             primary: widget.isPressed ? Colors.white : Colors.white70,
//             elevation: widget.isPressed ? 4 : 1,
//           ),
//           onPressed: ConvertIspressed,
//           child: widget.isPressed ? Text(widget.text.toString()) : Text(""),
//         ),
//       ),
//     );
//   }