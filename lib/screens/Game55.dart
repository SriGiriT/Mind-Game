import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/screens/Game1.dart';
import 'package:memory_matrix/screens/Game2.dart';

class Game55 extends StatefulWidget {
  const Game55({Key? key}) : super(key: key);

  @override
  State<Game55> createState() => _Game55State();
}

int count = 1;

class _Game55State extends State<Game55> {
  @override
  Widget build(BuildContext context) {
    count = 1;
    // assign 0 or 1 to each button
    List<int> list = List<int>.generate(36, (i) => Random().nextInt(2));
    bool isVissible = true;
    print(list);
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
                SingleButton(list[0], 0, false, isVissible),
                SingleButton(list[1], 1, false, isVissible),
                SingleButton(list[2], 2, false, isVissible),
                SingleButton(list[3], 3, false, isVissible),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list[4], 4, false, isVissible),
                SingleButton(list[5], 5, false, isVissible),
                SingleButton(list[6], 6, false, isVissible),
                SingleButton(list[7], 7, false, isVissible)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list[8], 8, false, isVissible),
                SingleButton(list[9], 9, false, isVissible),
                SingleButton(list[10], 10, false, isVissible),
                SingleButton(list[11], 11, false, isVissible)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list[12], 12, false, isVissible),
                SingleButton(list[13], 13, false, isVissible),
                SingleButton(list[14], 14, false, isVissible),
                SingleButton(list[15], 15, false, isVissible)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text("hide"),
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Game2(list)));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class SingleButton extends StatefulWidget {
  SingleButton(this.text, this.index, this.isPressed, this.isVissible);
  int text;
  bool isPressed;
  int index;
  bool isVissible;

  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  void ConvertIspressed() {
    setState(() {
      if (widget.text == 1) {
        count++;
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
          primary: widget.text == 1 ? Colors.lightBlue : Colors.white,
        ),
        onPressed: ConvertIspressed,
        child: Text(""),
      ),
    );
  }
}

/*

widget.text == 1 ? Colors.lightBlue : Colors.white,
@override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        color: widget.text == 1 ? Colors.lightBlue : Colors.white,
        onPressed: ConvertIspressed,
      ),
    );
  }
  */