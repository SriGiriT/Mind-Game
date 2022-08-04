import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/screens/Game1.dart';
import 'package:memory_matrix/screens/Game4.dart';
import 'package:memory_matrix/screens/Game444.dart';

List<int> list1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];

class Game444 extends StatefulWidget {
  Game444(this.list, this.score);
  List<int> list;
  int score;

  @override
  State<Game444> createState() => _Game444State();
}

int count = 1;

class _Game444State extends State<Game444> {
  @override
  Widget build(BuildContext context) {
    count = 1;
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
      ),
      body: SafeArea(
        // create matrix of 3 x 3 buttons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list1[0], 0, false, isVissible),
                SingleButton(list1[1], 1, false, isVissible),
                SingleButton(list1[2], 2, false, isVissible),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list1[3], 3, false, isVissible),
                SingleButton(list1[4], 4, false, isVissible),
                SingleButton(list1[5], 5, false, isVissible),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleButton(list1[6], 6, false, isVissible),
                SingleButton(list1[7], 7, false, isVissible),
                SingleButton(list1[8], 8, false, isVissible)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnswerButton(0, widget.list, score),
                AnswerButton(1, widget.list, score),
                AnswerButton(2, widget.list, score),
                AnswerButton(3, widget.list, score)
              ],
            ),
            Container(
              child: Text(
                'Score: $score',
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
            //           MaterialPageRoute(builder: (context) => Game444(list1)));
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
  AnswerButton(this.ind, this.list, this.score);
  int ind;
  List<int> list;
  int score;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
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
              score++;
            });
          }
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Game4(list1, score)));
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
  SingleButton(this.text, this.index, this.isPressed, this.isVissible);
  int text;
  bool isPressed;
  int index;
  bool isVissible;

  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  void ConvertIspressed() {
    setState(() {
      if (widget.text == count) {
        count++;
      } else {
        Navigator.pushNamed(context, '/wrong');
      }
      widget.isPressed = !widget.isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ConvertIspressed,
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
                  ? Icon(Icons.fiber_manual_record)
                  : Text('')),
        ),
      ),
    );
  }
}

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:memory_matrix/screens/Game1.dart';
// import 'package:memory_matrix/screens/Game4.dart';
// List<int> list1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
// class Game444 extends StatefulWidget {
//   Game444(this.list);
//   List<int> list;

//   @override
//   State<Game444> createState() => _Game444State();
// }

// int count = 1;

// class _Game444State extends State<Game444> {
//   @override
//   Widget build(BuildContext context) {
//     count = 1;
//     final numbers = Set<int>();
//     while (numbers.length < 3) {
//       numbers.add(Random().nextInt(9) + 1);
//     }
//     List<int> lis = numbers.toList();
//     print(lis);
//     list1[lis[0] - 1] = 1;
//     list1[lis[1] - 1] = 1;
//     list1[lis[2] - 1] = 1;
//     bool isVissible = true;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white54,
//         centerTitle: true,
//         title: Text('Memory'),
//       ),
//       body: SafeArea(
//         // create matrix of 3 x 3 buttons
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SingleButton(widget.list[0], 0, false, isVissible),
//                 SingleButton(widget.list[1], 1, false, isVissible),
//                 SingleButton(widget.list[2], 2, false, isVissible),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SingleButton(widget.list[3], 3, false, isVissible),
//                 SingleButton(widget.list[4], 4, false, isVissible),
//                 SingleButton(widget.list[5], 5, false, isVissible),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SingleButton(widget.list[6], 6, false, isVissible),
//                 SingleButton(widget.list[7], 7, false, isVissible),
//                 SingleButton(widget.list[8], 8, false, isVissible)
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             RaisedButton(
//               child: Text("hide"),
//               onPressed: () {
//                 setState(() {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Game4(list)));
//                 });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SingleButton extends StatefulWidget {
//   SingleButton(this.text, this.index, this.isPressed, this.isVissible);
//   int text;
//   bool isPressed;
//   int index;
//   bool isVissible;

//   @override
//   State<SingleButton> createState() => _SingleButtonState();
// }

// class _SingleButtonState extends State<SingleButton> {
//   void ConvertIspressed() {
//     setState(() {
//       if (widget.text == count) {
//         count++;
//       } else {
//         Navigator.pushNamed(context, '/wrong');
//       }
//       widget.isPressed = !widget.isPressed;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: GestureDetector(
//         onTap: ConvertIspressed,
//         child: Container(
//           width: 50,
//           height: 50,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.black,
//               width: 2,
//             ),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           // color: Colors.white,
//           child: Center(
//               child: widget.text == 1
//                   ? Icon(Icons.fiber_manual_record)
//                   : Text('')),
//         ),
//       ),
//     );
//   }
// }
