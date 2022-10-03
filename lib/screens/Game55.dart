import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame5.dart';
import 'package:memory_matrix/data/constants.dart';
import 'package:memory_matrix/screens/Game5.dart';
import 'package:memory_matrix/data/DataOf5.dart';

class Game55 extends StatefulWidget {
  const Game55({Key? key}) : super(key: key);

  @override
  State<Game55> createState() => _Game55State();
}

int count = 1;

class _Game55State extends State<Game55> {
  @override
  Widget build(BuildContext context) {
    // count = 1;
    // assign 0 or 1 to each button
    List<TilesForGame5> list = getPairs();
    list.shuffle();
    // for (int i = 0; i < 16; i++) {
    //   list.add(list1[lis[i] - 1]);
    // }
    print(list);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        centerTitle: true,
        title: Text(
          'Memory Matrix',
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
                      'Equal Cells.',
                      style: large_text
                    ),
                  ),
                  Container(
                    child: Text(
                      'Remember the location of the same pictures. The open them in pairs. Try not to be wrong.',
                      style: small_text
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
                    SingleButton(list[0].iconToDisplay),
                    SingleButton(list[1].iconToDisplay),
                    SingleButton(list[2].iconToDisplay),
                    SingleButton(list[3].iconToDisplay),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleButton(list[4].iconToDisplay),
                    SingleButton(list[5].iconToDisplay),
                    SingleButton(list[6].iconToDisplay),
                    SingleButton(list[7].iconToDisplay)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleButton(list[8].iconToDisplay),
                    SingleButton(list[9].iconToDisplay),
                    SingleButton(list[10].iconToDisplay),
                    SingleButton(list[11].iconToDisplay)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleButton(list[12].iconToDisplay),
                    SingleButton(list[13].iconToDisplay),
                    SingleButton(list[14].iconToDisplay),
                    SingleButton(list[15].iconToDisplay)
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  child: Text(
                    "hide",
                    style: large_text
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Game5(list)));
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
  IconData text;

  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
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
            child: Icon(widget.text,
                size: 25, color: const Color.fromARGB(221, 0, 0, 0)),
          ),
        ),
      ),
    );
  }
}
