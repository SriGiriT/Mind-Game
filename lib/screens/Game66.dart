import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memory_matrix/data/DataOf6.dart';
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        'Remember the word.',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Container(
                      child: const Text(
                        'Remember the word and type it correctly.',
                        style: const TextStyle(fontSize: 14),
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
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: const Text("Start"),
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
