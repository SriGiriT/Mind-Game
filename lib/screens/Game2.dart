import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/components/TilesForGame2.dart';
import 'package:memory_matrix/data/DataOf2.dart';
import 'package:memory_matrix/data/constants.dart';

import '../components/stopwatch.dart';

class Game2 extends StatefulWidget {
  Game2(this.list);
  List<TilesForGame2> list;
  @override
  State<Game2> createState() => _Game2State();
}

int score = 0;
int length = 0;
int tryy = 10;
String time = "";

class _Game2State extends State<Game2> {
  @override
  Widget build(BuildContext context) {
    if (!StopWatch.isRuning) {
      StopWatch.startStopwatch();
    }
    length = 0;
    int n = 16;
    int tryy = 10;
    for (int i = 0; i < widget.list.length; i++) {
      print(widget.list[i].val);
    }
    while (n-- > 0) {
      if (widget.list[n].val == 1) {
        length++;
      }
    }
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
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
                  SingleButton(widget.list[0]),
                  SingleButton(widget.list[1]),
                  SingleButton(widget.list[2]),
                  SingleButton(widget.list[3]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleButton(widget.list[4]),
                  SingleButton(widget.list[5]),
                  SingleButton(widget.list[6]),
                  SingleButton(widget.list[7]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleButton(widget.list[8]),
                  SingleButton(widget.list[9]),
                  SingleButton(widget.list[10]),
                  SingleButton(widget.list[11]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleButton(widget.list[12]),
                  SingleButton(widget.list[13]),
                  SingleButton(widget.list[14]),
                  SingleButton(widget.list[15]),
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
  SingleButton(this.text);
  TilesForGame2 text;
  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  bool isSelected = false;
  bool canSelect = true;
  DataOf2 ds = DataOf2();
  void ConvertIspressed() {
    if (canSelect) {
      setState(() {
        // if (!widget.text.getIsSelected()) {
        if (widget.text.val == 1) {
          widget.text.setIsSelected(true);
          isSelected = widget.text.getIsSelected();
          if (!widget.text.getAlreadySelected()) {
            widget.text.setAlreadySelected();
            length--;
          }
          if (length == 0) {
            widget.text.addScore();
            if (widget.text.getScore() == 2) {
              StopWatch.stopStopwatch();
              ds.saveSelecteedPage(time);
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
            tryy = 10;
            Navigator.pushNamed(context, '/wrong');
          }
        }
        // }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: isSelected ? 4 : 1,
          primary: isSelected ? Colors.blue : Color(0xFF1D1E33),
        ),
        onPressed: ConvertIspressed,
        child: const Text(""),
      ),
    );
  }
}
