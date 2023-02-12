import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/data/DataOf3.dart';
import 'package:memory_matrix/components/TilesForGame3.dart';
import 'package:memory_matrix/data/constants.dart';
import 'package:memory_matrix/screens/Game3.dart';

int score = 0;

class Game33 extends StatefulWidget {
  const Game33({Key? key}) : super(key: key);

  @override
  State<Game33> createState() => _Game33State();
}

int count = 1;

class _Game33State extends State<Game33> {
  @override
  Widget build(BuildContext context) {
    List<TilesForGame3> list = getPairs();
    list.shuffle();
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Ascending Numbers',
            style: large_text.copyWith(color: Colors.white),
          ),
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Ascending numbers.',
                          style: large_text,
                        ),
                      ),
                      Container(
                        child: Text(
                          'Remember the location of the number in the table.',
                          style: small_text,
                        ),
                      ),
                    ],
                  ),
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleButton(list[3]),
                      SingleButton(list[4]),
                      SingleButton(list[5]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleButton(list[6]),
                      SingleButton(list[7]),
                      SingleButton(list[8])
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    // color: Colors.blue,
                    child: Text("hide",
                        style: large_text.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Game3(list)));
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
  TilesForGame3 text;

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
            color: button_color,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.white,
          child: Center(
            child: widget.text.val <= 4 + widget.text.getScore()
                ? Text(widget.text.val.toString(), style: large_text)
                : const Text(""),
          ),
        ),
      ),
    );
  }
}
