import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/data/constants.dart';
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
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Memory Matrix',
              style: large_text.copyWith(color: Colors.white)),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                onBackPressed(context);
              }),
        ),
        body: SafeArea(
          // create matrix of 3 x 3 buttons
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Text('Memory Matrix.', style: large_text),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Text(
                          'You will see green squares in front of you, which are arranged in a random order.',
                          style: small_text),
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
                    color: Colors.blue,
                    child: Text("hide",
                        style: large_text.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Game2(list)));
                      });
                    },
                  )
                ],
              ),
            ],
          ),
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
          primary: widget.text.getIconData() == 1 ? Colors.blue : button_color,
        ),
        onPressed: () {},
        child: const Text(""),
      ),
    );
  }
}
