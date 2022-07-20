import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/screens/Game1.dart';
import 'package:memory_matrix/screens/Game4.dart';

class Game44 extends StatefulWidget {
  const Game44({Key? key}) : super(key: key);

  @override
  State<Game44> createState() => _Game44State();
}

int count = 1;

class _Game44State extends State<Game44> {
  @override
  Widget build(BuildContext context) {
    count = 1;
    List<int> lis = List<int>.generate(3, (i) => Random().nextInt(9));
    print(lis);
    List<int> list = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    list[lis[0]] = 1;
    list[lis[1]] = 1;
    list[lis[2]] = 1;
    bool isVissible = true;
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
                SingleButton(list[0], 0, false, isVissible),
                SingleButton(list[1], 1, false, isVissible),
                SingleButton(list[2], 2, false, isVissible),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list[3], 3, false, isVissible),
                SingleButton(list[4], 4, false, isVissible),
                SingleButton(list[5], 5, false, isVissible),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list[6], 6, false, isVissible),
                SingleButton(list[7], 7, false, isVissible),
                SingleButton(list[8], 8, false, isVissible)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("hide"),
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Game4(list)));
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
      if (widget.text == count) {
        count++;
      } else {
        Navigator.pushNamed(context, '/wrong');
      }
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
          child: Center(
              child: widget.text == 1
                  ? Icon(Icons.fiber_manual_record)
                  : Text('')),
        ),
      ),
    );
  }
}

/*
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        color: Colors.white,
        onPressed: ConvertIspressed,
        child: Text(widget.text.toString()),
      ),
    );
  }
  */