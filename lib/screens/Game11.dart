import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/screens/Game1.dart';

class Game11 extends StatefulWidget {
  const Game11({Key? key}) : super(key: key);

  @override
  State<Game11> createState() => _Game11State();
}

int count = 1;

class _Game11State extends State<Game11> {
  @override
  Widget build(BuildContext context) {
    count = 1;
    final numbers = Set<int>();
    while (numbers.length < 9) {
      numbers.add(Random().nextInt(9) + 1);
    }
    print(numbers);
    bool isVissible = true;
    List<int> list = numbers.toList();
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
                      MaterialPageRoute(builder: (context) => Game1(list)));
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
        Navigator.pushNamed(context, '/settings');
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
              child: Text(
            widget.text.toString(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto'),
          )),
        ),
      ),
    );
  }
}
