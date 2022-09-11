import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame6.dart';
import 'package:memory_matrix/data/DataOf4.dart';
import 'package:memory_matrix/data/DataOf6.dart';
import 'package:memory_matrix/screens/Game6.dart';

class Game6 extends StatefulWidget {
  Game6(this.word, this.pre_inp);
  String word;
  String pre_inp;

  @override
  State<Game6> createState() => _Game6State();
}

int count = 1;

class _Game6State extends State<Game6> {
  @override
  String word1 = new DataOf6().getWord();
  Widget build(BuildContext context) {
    TilesForGame6 tile = TilesForGame6();
    if (tile.getScore() > 10) {
      Navigator.pushNamed(context, '/settings');
      return Scaffold(
        body: Text(""),
      );
    } else {
      if (widget.pre_inp == widget.word) {
        tile.addScore();
      }
      String inp = "";
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          centerTitle: true,
          title: const Text('Remember the word'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              }),
        ),
        body: SafeArea(
          // create matrix of 3 x 3 buttons
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(word1),
                    TextField(
                      autocorrect: true,
                      textAlign: TextAlign.center,
                      onChanged: (newText) {
                        inp = newText;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      child: const Text("Next"),
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Game6(word1, inp)));
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
}
