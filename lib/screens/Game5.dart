import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame5.dart';
import 'package:memory_matrix/data/constants.dart';
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
    // for (int i = 0; i < widget.list.length; i++) {
    //   print(widget.list[i]);
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        centerTitle: true,
        title: Text(
          'Memory Matrix',
          style: large_text
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
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
            const SizedBox(
              height: 30,
            ),
            Text(
              'Score: ${widget.list[0].getScore()}',
              style: large_text
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
            color: button_color,
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
                    color: const Color.fromARGB(255, 42, 250, 156),
                  )
                : const Text(""),
          ),
        ),
      ),
    );
  }
}
