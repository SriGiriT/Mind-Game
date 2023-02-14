import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame1.dart';
import 'package:memory_matrix/components/TilesForGame3.dart';
import 'package:memory_matrix/components/TilesForGame4.dart';
import 'package:memory_matrix/components/TilesForGame5.dart';
import 'package:memory_matrix/components/TilesForGame6.dart';
import 'package:memory_matrix/components/stopwatch.dart';
import 'package:memory_matrix/screens/main_screen.dart';

import '../components/TilesForGame2.dart';

TextStyle small_text = const TextStyle(
    fontSize: 20,
    fontFamily: "Roboto",
    fontWeight: FontWeight.normal,
    color: Colors.white);

TextStyle large_text = const TextStyle(
    fontSize: 24,
    fontFamily: "Roboto",
    fontWeight: FontWeight.bold,
    color: Colors.white);

Color button_color = Color(0xFF1D1E33);
Color box_color = Color(0xFF1D1E33);

Future<bool> onBackPressed(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Do you really want to exit the level?"),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text("No"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => MyMainScreen()));
            if (StopWatch.isRuning) {
              StopWatch.stopStopwatch();
            }
          },
          child: Text("Yes"),
        ),
      ],
    ),
  ).then((value) => value ?? false);
}

void resetWrongScore() {
  TilesForGame1.score = 0;
  TilesForGame2.score = 0;
  TilesForGame3.score = 0;
  TilesForGame4.score = 0;
  TilesForGame5.score = 0;
  TilesForGame6.score = 0;
}

Container timerContainer(String timer) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    child: Center(
      child: Text(
        timer,
        style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade400),
      ),
    ),
  );
}
