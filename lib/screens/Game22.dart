import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/screens/Game2.dart';
import 'package:memory_matrix/components/TilesForGame2.dart';
import 'package:memory_matrix/data/DataOf2.dart';

class Game22 extends StatefulWidget {
  const Game22({Key? key}) : super(key: key);

  @override
  State<Game22> createState() => _Game12State();
}

int count = 1;

class _Game12State extends State<Game22> {
  @override
  Widget build(BuildContext context) {
    count = 1;
    // assign 0 or 1 to each button
    List<TilesForGame2> list = getPairs();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: const Text('Memory Matrix'),
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
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: const Text(
                      'Memory Matrix.',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: const Text(
                      'You will see green squares in front of you, which are arranged in a random order.After pressing the start button, they will disappear, and you need to find them. Try to do it as quickly as possible, but don\' make mistakes.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleButton(list[0]),
                    SingleButton(list[1]),
                    SingleButton(list[2]),
                    SingleButton(list[3]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleButton(list[4]),
                    SingleButton(list[5]),
                    SingleButton(list[6]),
                    SingleButton(list[7]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleButton(list[8]),
                    SingleButton(list[9]),
                    SingleButton(list[10]),
                    SingleButton(list[11]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleButton(list[12]),
                    SingleButton(list[13]),
                    SingleButton(list[14]),
                    SingleButton(list[15]),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  child: const Text("hide"),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Game2(list)));
                    });
                  },
                )
              ],
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
          primary:
              widget.text.getIconData() == 1 ? Colors.lightBlue : Colors.white,
        ),
        onPressed: () {},
        child: const Text(""),
      ),
    );
  }
}
