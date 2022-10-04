import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/data/constants.dart';

class Wrong extends StatefulWidget {
  const Wrong({Key? key}) : super(key: key);

  @override
  State<Wrong> createState() => _WrongState();
}

class _WrongState extends State<Wrong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 20,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Wrong', style: large_text,),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('You have failed the game', style: small_text)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Container(
                  height: 50,
                  width: 125,
                  child: Row(
                    children: [
                      Icon(Icons.replay),
                      Text('Play again', style:large_text,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
