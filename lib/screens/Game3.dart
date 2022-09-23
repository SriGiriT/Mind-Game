import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/components/TilesForGame3.dart';
import 'package:memory_matrix/data/constants.dart';

class Game3 extends StatefulWidget {
  Game3(this.list);
  List<TilesForGame3> list;

  @override
  State<Game3> createState() => _Game3State();
}

int count = 1;
int tryy = 10;

class _Game3State extends State<Game3> {
  @override
  Widget build(BuildContext context) {
    count = 1;
    for (int i = 0; i < widget.list.length; i++) {
      print(widget.list[i].val);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text(
          'Ascending Numbers',
          style: large_text,
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
              style: large_text
            ),
          ],
        ),
      ),
    );
  }
}

class SingleButton extends StatefulWidget {
  SingleButton(this.text);
  TilesForGame3 text;

  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  void ConvertIspressed() {
    setState(() {
      if (widget.text.val == count) {
        print(count);
        print(widget.text.val);
        if (widget.text.getScore() == 7) {
          widget.text.resetScore();
          count = 0;
          Navigator.pushNamed(context, '/success');
          return;
        }
        if (count == widget.text.getScore() + 3) {
          widget.text.addScore();
          Navigator.pop(context);
        }
      } else {
        tryy--;
        if (tryy == 0) {
          Navigator.pushNamed(context, '/wrong');
        }
      }
      count++;
      widget.text.setIsSelected(!widget.text.getIsSelected());
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
          child: widget.text.isSelected
              ? Center(
                  child: Text(
                    widget.text.val.toString(),
                    style: small_text
                  ),
                )
              : const Text(""),
        ),
      ),
    );
  }
}
