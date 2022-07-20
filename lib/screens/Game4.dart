import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Game4 extends StatelessWidget {
  const Game4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 20,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('back'),
      ),
      body: SafeArea(
        child: Column(children: [
          Center(child: Text("Hello 4")),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Back"),
          )
        ]),
      ),
    );
  }
}
