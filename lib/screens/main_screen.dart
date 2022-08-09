import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame1.dart';
import 'package:memory_matrix/components/TilesForGame2.dart';
import 'package:memory_matrix/components/TilesForGame3.dart';
import 'package:memory_matrix/components/TilesForGame5.dart';
import 'package:memory_matrix/data/DataOf4.dart';

class MyMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.settings),
      //       onPressed: () {
      //         Navigator.pushNamed(context, '/settings');
      //       },
      //     ),
      //   ],
      //   centerTitle: true,
      //   title: Text("Memory Matrix"),
      //   backgroundColor: Colors.white54,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Text(
                "Exercises.", // 6 no  8 yes 9 no 16 yes 23 yes.  nos 6 9.
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "Practice daily or when you can't concentrate and you will see improvement very soon.",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Listofgames(1, "Memory.                                         ",
                  () {
                Navigator.pushNamed(context, '/game11');
              }, "Memorize positions", TilesForGame1.getTotalScore()),
              Listofgames(2, "Memory Matrix.                           ", () {
                Navigator.pushNamed(context, '/game2');
              }, "Remember and find the right cells",
                  TilesForGame2.getTotalScore()),
              Listofgames(3, "Ascending Numbers.                  ", () {
                Navigator.pushNamed(context, '/game3');
              }, "Remember and find numbers in ascending order.",
                  TilesForGame3.getTotalScore()),
              Listofgames(4, "Positions change.                        ", () {
                Navigator.pushNamed(context, '/game4');
              }, "Count the number of points that haven't changed their position.",
                  DataOf4.getTotalScore()),
              Listofgames(5, "Equal cells.                                    ",
                  () {
                Navigator.pushNamed(context, '/game5');
              }, "Find the identical cells", TilesForGame5.getTotalScore()),
            ],
          ),
        ),
      ),
    );
  }
}

class Listofgames extends StatelessWidget {
  Listofgames(this.ind, this.text, this.pressed, this.description, this.score);
  String text;
  String description;
  int ind;
  void Function()? pressed;
  int score;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        color: Colors.white70,
        height: 100,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${ind}.',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${text}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "${score}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "${description}",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
