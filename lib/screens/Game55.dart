import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/screens/Game1.dart';
import 'package:memory_matrix/screens/Game2.dart';
import 'package:memory_matrix/screens/Game5.dart';

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
    final numbers = Set<int>();
    while (numbers.length < 16) {
      numbers.add(Random().nextInt(16) + 1);
    }
    print(numbers);
    bool isVissible = true;
    List<int> lis = numbers.toList();
    List<IconData> list1 = [
      Icons.car_crash,
      Icons.car_crash,
      Icons.abc,
      Icons.abc,
      Icons.check,
      Icons.check,
      Icons.place,
      Icons.place,
      Icons.access_alarm,
      Icons.access_alarm,
      Icons.find_in_page,
      Icons.find_in_page,
      Icons.air,
      Icons.air,
      Icons.help,
      Icons.help
    ];
    List<IconData> list = [];
    for (int i = 0; i < 16; i++) {
      list.add(list1[lis[i] - 1]);
    }
    print(list);
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
                      MaterialPageRoute(builder: (context) => Game5(list)));
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
  IconData text;
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
            child: Icon(widget.text, size: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
