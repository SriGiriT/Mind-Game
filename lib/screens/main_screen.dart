import 'package:flutter/material.dart';

class MyMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
        centerTitle: true,
        title: Text("Memory Matrix"),
        backgroundColor: Colors.white54,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              Listofgames(1, "Memory", () {
                Navigator.pushNamed(context, '/game11');
              }),
              Listofgames(2, "Memory Matrix", () {
                Navigator.pushNamed(context, '/game2');
              }),
              Listofgames(3, "Ascending Numbers", () {
                Navigator.pushNamed(context, '/game3');
              }),
              Listofgames(4, "Game 04", () {
                Navigator.pushNamed(context, '/game4');
              }),
              Listofgames(5, "Game 05", () {
                Navigator.pushNamed(context, '/game5');
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class Listofgames extends StatelessWidget {
  Listofgames(this.ind, this.text, this.pressed);
  String text;
  int ind;
  void Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        color: Colors.white70,
        height: 100,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '${ind}.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${text}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "Description of the game something like that we need to tell about that game",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
