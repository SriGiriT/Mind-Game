import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/components/TilesForGame1.dart';
import 'package:memory_matrix/data/DataOf1.dart';
import 'package:memory_matrix/screens/Success.dart';

class Game1 extends StatefulWidget {
  Game1(this.list);
  List<TilesForGame1> list;

  @override
  State<Game1> createState() => _Game1State();
}

int count = 1;
int tryy = 10;

class _Game1State extends State<Game1> {
  @override
  Widget build(BuildContext context) {
    count = 1;
    tryy = 10;
    for (int i = 0; i < widget.list.length; i++) {
      print(widget.list[i].val);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: const Text('Memory'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            }),
      ),
      body: SafeArea(
        // create matrix of 3 x 3 buttons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
              ],
            ),
          ],
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
  void ConvertIspressed() {
    setState(() {
      if (widget.text.val == count) {
        count++;
        if (count == 10) {
          widget.text.addScore();
          if (widget.text.getScore() == 10) {
            widget.text.resetScore();
            Navigator.pushNamed(context, '/success');
            return;
          }
          Navigator.pop(context);
        }
        widget.text.setIsSelected(!widget.text.getIsSelected());
      } else {
        tryy--;
        if (tryy == 0) {
          Navigator.pushNamed(context, '/wrong');
        }
        print(tryy);
      }
    });
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
            color: widget.text.isSelected ? Colors.white : Colors.white70,
          ),
          child: widget.text.getIsSelected()
              ? Center(
                  child: Text(
                  widget.text.val.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ))
              : const Text(""),
        ),
      ),
    );
  }
}
