import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame6.dart';
import 'package:memory_matrix/data/DataOf4.dart';
import 'package:memory_matrix/data/DataOf6.dart';
import 'package:memory_matrix/data/constants.dart';
import 'package:memory_matrix/screens/Success.dart';
import 'package:memory_matrix/screens/Game6.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

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
        centerTitle: true,
        title: Text('Hangman', style: large_text.copyWith(color: Colors.white)),
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
                  Text(word1, style: large_text),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: TextField(
                      style: large_text,
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
                    color: Colors.blue,
                    child: Text("Next",
                        style: large_text.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                    onPressed: () {
                      print(inp + " | " + widget.word);
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
                      if (tile.getScore() == 10) {
                        tile.resetScore();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Success()));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Score: ${tile.getScore()}', style: large_text)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
