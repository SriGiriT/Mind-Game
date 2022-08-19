import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/data/DataOf4.dart';
import 'package:memory_matrix/screens/Game1.dart';
import 'package:memory_matrix/screens/Game4.dart';
import 'package:memory_matrix/screens/Game444.dart';
import 'package:memory_matrix/screens/Success.dart';

List<int> list1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];

class Game4 extends StatefulWidget {
  Game4(this.list);
  List<int> list;
  @override
  State<Game4> createState() => _Game4State();
}

int count = 1;
int score = 0;

class _Game4State extends State<Game4> {
  @override
  Widget build(BuildContext context) {
    count = 1;
    DataOf4 dat = DataOf4();
    final numbers = Set<int>();
    while (numbers.length < 3) {
      numbers.add(Random().nextInt(9) + 1);
    }
    List<int> lis = numbers.toList();
    print(lis);
    list1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    list1[lis[0] - 1] = 1;
    list1[lis[1] - 1] = 1;
    list1[lis[2] - 1] = 1;
    bool isVissible = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text('Memory'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            }),
      ),
      body: SafeArea(
        // create matrix of 3 x 3 buttons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list1[0], 0, false),
                SingleButton(list1[1], 1, false),
                SingleButton(list1[2], 2, false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list1[3], 3, false),
                SingleButton(list1[4], 4, false),
                SingleButton(list1[5], 5, false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list1[6], 6, false),
                SingleButton(list1[7], 7, false),
                SingleButton(list1[8], 8, false)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnswerButton(0, widget.list),
                AnswerButton(1, widget.list),
                AnswerButton(2, widget.list),
                AnswerButton(3, widget.list)
              ],
            ),
            Container(
              child: Text(
                'Score: ${dat.getScore()}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
            // RaisedButton(
            //   child: Text("hide"),
            //   onPressed: () {
            //     setState(() {
            //       list1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => Game4(list1)));
            //     });
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

class AnswerButton extends StatefulWidget {
  AnswerButton(this.ind, this.list);
  int ind;
  List<int> list;
  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    DataOf4 data = DataOf4();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          int countt = widget.ind;
          int temp = 0;
          for (int i = 0; i < 9; i++) {
            if (list1[i] == 1 && widget.list[i] == 1) {
              temp++;
            }
          }
          if (temp == countt) {
            print("hey");
            setState(() {
              data.addScore();
            });
          }
          if (data.getScore() >= 10) {
            data.resetScore();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Success()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Game444(list1)));
          }
          print(count);
          print(list1);
          print(widget.list);
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.white,
          child: Center(
            child: Text(
              '${widget.ind}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class SingleButton extends StatefulWidget {
  SingleButton(this.text, this.index, this.isPressed);
  int text;
  bool isPressed;
  int index;

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
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.white,
          child: Center(
              child: widget.text == 1
                  ? Icon(
                      Icons.fiber_manual_record,
                      color: Colors.redAccent,
                    )
                  : Text('')),
        ),
      ),
    );
  }
}
