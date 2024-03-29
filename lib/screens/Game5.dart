import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame5.dart';
import 'package:memory_matrix/data/DataOf4.dart';
import 'package:memory_matrix/data/constants.dart';
import 'package:memory_matrix/screens/Success.dart';

import '../components/stopwatch.dart';
import '../data/DataOf5.dart';

class Game5 extends StatefulWidget {
  Game5(this.list);
  List<TilesForGame5> list;
  @override
  State<Game5> createState() => _Game5State();
}

IconData icon = Icons.fire_extinguisher;
int score = 0;
int length = 0;
int count = 0;
int tryy = 10;
String time = "";

class _Game5State extends State<Game5> {
  @override
  Widget build(BuildContext context) {
    if (!StopWatch.isRuning) {
      StopWatch.startStopwatch();
    }
    tryy = 10;
    count = 0;
    return WillPopScope(
      onWillPop: () {
        icon = Icons.fire_extinguisher;
        return onBackPressed(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
          title: Text('Memory Matrix',
              style: large_text.copyWith(color: Colors.white)),
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
                  SingleButton(widget.list[0], 0),
                  SingleButton(widget.list[1], 1),
                  SingleButton(widget.list[2], 2),
                  SingleButton(widget.list[3], 3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleButton(widget.list[4], 4),
                  SingleButton(widget.list[5], 5),
                  SingleButton(widget.list[6], 6),
                  SingleButton(widget.list[7], 7)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleButton(widget.list[8], 8),
                  SingleButton(widget.list[9], 9),
                  SingleButton(widget.list[10], 10),
                  SingleButton(widget.list[11], 11)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleButton(widget.list[12], 12),
                  SingleButton(widget.list[13], 13),
                  SingleButton(widget.list[14], 14),
                  SingleButton(widget.list[15], 15)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text('Score: ${widget.list[0].getScore()}', style: large_text),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleButton extends StatefulWidget {
  SingleButton(this.text, this.index);
  TilesForGame5 text;
  int index;

  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  bool isSelected = false;
  bool canSelect = true;
  DataOf5 ds = DataOf5();
  void ConvertIspressed() {
    if (canSelect) {
      setState(() {
        if (icon == Icons.fire_extinguisher) {
          icon = widget.text.iconToDisplay;
          widget.text.setIsSelected(true);
          isSelected = widget.text.getIsSelected();
        } else if (icon == widget.text.iconToDisplay) {
          icon = Icons.fire_extinguisher;
          widget.text.setIsSelected(true);
          isSelected = widget.text.getIsSelected();
          count++;
          if (count == 8) {
            widget.text.addScore();
            if (widget.text.getScore() == 2) {
              StopWatch.stopStopwatch();
              ds.saveSelecteedPage(time);
              icon = Icons.fire_extinguisher;
              widget.text.resetScore();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Success(),
                ),
              );
              return;
            }
            Navigator.pop(context);
          }
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
            icon = Icons.fire_extinguisher;
            print("attempt ended");
            tryy = 10;
            Navigator.pushNamed(context, '/wrong');
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: ConvertIspressed,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.lightGreen
                : Color.fromARGB(255, 236, 91, 91),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.white,
          child: Center(
            child: isSelected
                ? Icon(
                    widget.text.iconToDisplay,
                    size: 25,
                  )
                : const Text(""),
          ),
        ),
      ),
    );
  }
}
