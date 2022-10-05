import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/data/DataOf6.dart';
import 'package:memory_matrix/data/constants.dart';
import 'package:memory_matrix/screens/Game6.dart';

class Game66 extends StatefulWidget {
  const Game66({Key? key}) : super(key: key);

  @override
  State<Game66> createState() => _Game66State();
}

String inp = "";

class _Game66State extends State<Game66> {
  @override
  String word1 = new DataOf6().getWord();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Remember the word',
          style: large_text.copyWith(color: Colors.white)
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Remember the word.',
                        style: large_text,
                      ),
                    ),
                    Container(
                      child: Text(
                        'Remember the word and type it correctly.',
                        style: small_text
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    word1,
                    style: large_text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "Start",
                      style: large_text.copyWith(fontWeight: FontWeight.normal, color: Colors.white)
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Game6(word: word1)));
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
