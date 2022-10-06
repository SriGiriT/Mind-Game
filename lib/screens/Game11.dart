import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory_matrix/components/TilesForGame1.dart';
import 'package:memory_matrix/data/DataOf1.dart';
import 'package:memory_matrix/data/constants.dart';
import 'package:memory_matrix/screens/Game1.dart';

class Game11 extends StatefulWidget {
  const Game11({Key? key}) : super(key: key);

  @override
  State<Game11> createState() => _Game11State();
}

int count = 1;

class _Game11State extends State<Game11> {
  @override
  Widget build(BuildContext context) {
    List<TilesForGame1> list = getPairs();
    list.shuffle();
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Memory',
            style: large_text.copyWith(color: Colors.white)
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                onBackPressed(context);
              }),
        ),
        body: SafeArea(
          // create matrix of 3 x 3 buttons
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Memory',
                          style: large_text
                        ),
                      ),
                      Container(
                        child: Text(
                          'Remember the positions of all numbers and click the Hide button.',
                          style: small_text
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleButton(list[0].val),
                      SingleButton(list[1].val),
                      SingleButton(list[2].val),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleButton(list[3].val),
                      SingleButton(list[4].val),
                      SingleButton(list[5].val),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleButton(list[6].val),
                      SingleButton(list[7].val),
                      SingleButton(list[8].val)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "hide",
                      style: large_text.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.normal)
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Game1(list)));
                      });
                    },
                  )
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
  int text;

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
            color: button_color,
            border: Border.all(
              // color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // color: Colors.white,
          child: Center(
              child: Text(
            widget.text.toString(),
            style: large_text
          )),
        ),
      ),
    );
  }
}
