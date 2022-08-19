import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/components/TilesForGame5.dart';
import 'package:memory_matrix/screens/Game55.dart';
import 'package:memory_matrix/screens/Settings_screen.dart';
import 'package:memory_matrix/screens/Success.dart';

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

class _Game5State extends State<Game5> {
  @override
  Widget build(BuildContext context) {
    tryy = 10;
    count = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text('Memory Matrix'),
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
            SizedBox(
              height: 30,
            ),
            Text(
              'Score: ${widget.list[0].getScore()}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ],
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
            if (widget.text.getScore() == 10) {
              widget.text.resetScore();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Success(),
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
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              canSelect = true;
              isSelected = false;
            });
          });
          tryy--;
          if (tryy == 0) {
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
                    color: Color.fromARGB(221, 0, 0, 0),
                  )
                : Text(""),
          ),
        ),
      ),
    );
  }
}
