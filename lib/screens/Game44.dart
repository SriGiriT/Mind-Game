import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/data/DataOf4.dart';
import 'package:memory_matrix/data/constants.dart';
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
    final numbers = <int>{};
    while (numbers.length < 3) {
      numbers.add(Random().nextInt(9) + 1);
    }
    List<int> lis = numbers.toList();
    print(lis);
    List<int> list = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    list[lis[0] - 1] = 1;
    list[lis[1] - 1] = 1;
    list[lis[2] - 1] = 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text(
          'Memory',
          style: large_text
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            }),
      ),
      body: SafeArea(
        // create matrix of 3 x 3 buttons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Positions Change.',
                      style: large_text
                    ),
                  ),
                  Container(
                    child: Text(
                      'Remember the location of all point BEFORE EACH CLICK. Your task is to calculate how many points DIDN\'T change the position and choose the correct answer.',
                      style: small_text
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleButton(list[0], false),
                    SingleButton(list[1], false),
                    SingleButton(list[2], false),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleButton(list[3], false),
                    SingleButton(list[4], false),
                    SingleButton(list[5], false),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleButton(list[6], false),
                    SingleButton(list[7], false),
                    SingleButton(list[8], false)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: Text(
                    "hide",
                    style: large_text
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Game4(list)));
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SingleButton extends StatefulWidget {
  SingleButton(this.text, this.isPressed);
  int text;
  bool isPressed;
  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
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
                  ? const Icon(Icons.fiber_manual_record,
                      color: Colors.redAccent)
                  : const Text('')),
        ),
      ),
    );
  }
}
