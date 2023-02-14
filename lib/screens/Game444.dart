import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame4.dart';
import 'package:memory_matrix/components/TilesForGame6.dart';
import 'package:memory_matrix/data/DataOf4.dart';
import 'package:memory_matrix/data/constants.dart';
import 'package:memory_matrix/screens/Game4.dart';
import 'package:memory_matrix/screens/Success.dart';
import 'package:memory_matrix/components/stopwatch.dart';

List<int> list1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];

class Game444 extends StatefulWidget {
  Game444(this.list);
  List<int> list;

  @override
  State<Game444> createState() => _Game444State();
}

int count = 1;

class _Game444State extends State<Game444> {
  @override
  Widget build(BuildContext context) {
    count = 1;
    DataOf4 dat = DataOf4();
    final numbers = <int>{};
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
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text('Memory', style: large_text.copyWith(color: Colors.white)),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                onBackPressed(context);
              }),
        ),
        body: SafeArea(
          // create matrix of 3 x 3 buttons
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StreamBuilder(
                      stream: StopWatch.stopwatchController.stream,
                      initialData: 0,
                      builder: (context, snapshot) {
                        int elapsedTime = snapshot.data as int;
                        Duration duration = Duration(milliseconds: elapsedTime);
                        String elapsedTimeString =
                            '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}.${(duration.inMilliseconds % 1000).toString().padLeft(3, '0')}';
                        time = elapsedTimeString;
                        return timerContainer(elapsedTimeString);
                      })
                ],
              ),
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
              const SizedBox(
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
                child: Text('Score: ${dat.getScore()}', style: large_text),
              )
            ],
          ),
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
          if (data.getScore() >= 2) {
            data.saveSelecteedPage(time);
            StopWatch.stopStopwatch();
            data.resetScore();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Success()));
          } else {
            Navigator.popUntil(context, ModalRoute.withName('/'));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Game4(list1)));
          }
          print(count);
          print(list1);
          print(widget.list);
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: button_color,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.white,
          child: Center(
            child: Text('${widget.ind}', style: large_text),
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
            color: button_color,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.white,
          child: Center(
              child: widget.text == 1
                  ? const Icon(
                      Icons.fiber_manual_record,
                      color: Colors.redAccent,
                    )
                  : const Text('')),
        ),
      ),
    );
  }
}
