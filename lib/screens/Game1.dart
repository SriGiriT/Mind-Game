import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/components/TilesForGame1.dart';
import 'package:memory_matrix/components/stopwatch.dart';
import 'package:memory_matrix/data/DataOf1.dart';
import 'package:memory_matrix/data/constants.dart';
import 'package:memory_matrix/screens/Success.dart';

class Game1 extends StatefulWidget {
  Game1(this.list);
  List<TilesForGame1> list;

  @override
  State<Game1> createState() => _Game1State();
}

int count = 1;
int tryy = 10;
String time = "";

class _Game1State extends State<Game1> {
  @override
  Widget build(BuildContext context) {
    if (!StopWatch.isRuning) {
      StopWatch.startStopwatch();
    }
    count = 1;
    tryy = 10;
    for (int i = 0; i < widget.list.length; i++) {
      print(widget.list[i].val);
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
        centerTitle: true,
        title: Text('Memory', style: large_text.copyWith(color: Colors.white)),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              onBackPressed(context);
            }),
      ),
      body: WillPopScope(
        onWillPop: () => onBackPressed(context),
        child: SafeArea(
          // create matrix of 3 x 3 buttons
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleButton(widget.list[0]),
                      SingleButton(widget.list[1]),
                      SingleButton(widget.list[2]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleButton(widget.list[3]),
                      SingleButton(widget.list[4]),
                      SingleButton(widget.list[5]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleButton(widget.list[6]),
                      SingleButton(widget.list[7]),
                      SingleButton(widget.list[8])
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Score: ${widget.list[0].getScore()}',
                    style: large_text,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleButton extends StatefulWidget {
  SingleButton(this.text);
  TilesForGame1 text;

  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  bool isSelected = false;
  bool canSelect = true;
  DataOf1 ds = DataOf1();
  void ConvertIspressed() {
    if (canSelect) {
      setState(() {
        if (widget.text.val == count) {
          count++;
          widget.text.setIsSelected(true);
          isSelected = widget.text.getIsSelected();
          if (count == 10) {
            widget.text.addScore();
            if (widget.text.getScore() == 2) {
              // TilesForGame1.timer = time;
              ds.saveSelecteedPage(time);
              StopWatch.stopStopwatch();
              widget.text.resetScore();
              Navigator.pushNamed(context, '/success');
              return;
            }
            Navigator.pop(context);
          }
          widget.text.setIsSelected(!widget.text.getIsSelected());
        } else {
          setState(() {
            canSelect = false;
            isSelected = true;
          });
          Future.delayed(const Duration(milliseconds: 600), () {
            setState(() {
              canSelect = true;
              isSelected = false;
            });
          });
          tryy--;
          if (tryy == 0) {
            Navigator.pushNamed(context, '/wrong');
          }
          print(tryy);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ConvertIspressed,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? Colors.lightGreen
                : Color.fromARGB(255, 236, 91, 91),
          ),
          child: isSelected
              ? Center(
                  child: Text(widget.text.val.toString(), style: large_text),
                )
              : const Text(""),
        ),
      ),
    );
  }
}
