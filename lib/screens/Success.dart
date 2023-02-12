import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:memory_matrix/components/stopwatch.dart';
import 'package:memory_matrix/data/constants.dart';
import 'package:memory_matrix/screens/main_screen.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 20,
            onPressed: () {
              onBackPressed(context);
            },
          ),
          centerTitle: true,
          title:
              Text('Success', style: large_text.copyWith(color: Colors.white)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('You have successfully completed the game',
                        style: small_text),
                  ),
                  Text('Your score is: 10', style: small_text),
                  ElevatedButton(
                    onPressed: () {
                      StopWatch.stopStopwatch();
                      // Navigator.popUntil(context, ModalRoute.withName('/'));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyMainScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 125,
                      child: Row(
                        children: [
                          Icon(Icons.replay),
                          Text(
                            'Play again',
                            style: small_text.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
