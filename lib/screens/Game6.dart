import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame6.dart';
import 'package:memory_matrix/data/DataOf4.dart';
import 'package:memory_matrix/data/DataOf6.dart';
import 'package:memory_matrix/data/constants.dart';
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
        backgroundColor: Color(0xFF0A0E21),
        centerTitle: true,
        title: Text(
          'Remember the word',
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    word1,
                    style: large_text.copyWith(color: Color.fromARGB(255, 42, 250, 156))
                  ),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: TextField(
                      style: large_text,
                      cursorColor: Color.fromARGB(255, 42, 250, 156),
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
                    child: Text(
                      "Next",
                      style: large_text
                    ),
                    onPressed: () {
                      print(inp + " | " + widget.word);
                      if (tile.getScore() > 10) {
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
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Score: ${tile.getScore()}',
                    style: large_text
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
