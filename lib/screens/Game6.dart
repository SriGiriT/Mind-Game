import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame6.dart';
import 'package:memory_matrix/data/DataOf4.dart';
import 'package:memory_matrix/data/DataOf6.dart';
import 'package:memory_matrix/screens/Success.dart';
import 'package:memory_matrix/screens/Game6.dart';

class Game6 extends StatefulWidget {
  Game6({required this.word});
  String word;

  @override
  State<Game6> createState() => _Game6State();
}

String inp = "";

class _Game6State extends State<Game6> {
  @override
  String word1 = new DataOf6().getWord();
  Widget build(BuildContext context) {
    TilesForGame6 tile = TilesForGame6();
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
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: TextField(
                      autocorrect: true,
                      textAlign: TextAlign.center,
                      onChanged: (newText) {
                        setState(() {
                          inp = newText;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: const Text("Next"),
                    onPressed: () {
                      print(inp + " | " + widget.word);
                      if (tile.getScore() > 9) {
                        tile.resetScore();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Success()));
                      } else {
                        bool isCorrect =
                            new DataOf6().isCorrect(inp, widget.word);
                        if (isCorrect) {
                          tile.addScore();
                          print(tile.getScore());
                        }
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Game6(word: word1)));
                        });
                      }
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
