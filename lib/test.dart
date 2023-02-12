import 'dart:async';
import 'package:flutter/material.dart';

import 'components/stopwatch.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  StopWatch st = StopWatch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: StopWatch.stopwatchController.stream,
        initialData: 0,
        builder: (context, snapshot) {
          int elapsedTime = snapshot.data as int;
          Duration duration = Duration(milliseconds: elapsedTime);
          String elapsedTimeString =
              '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}.${(duration.inMilliseconds % 1000).toString().padLeft(3, '0')}';
          return Center(
            child: Text('Elapsed time: $elapsedTimeString'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          StopWatch.startStopwatch();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GamePage()));
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

class GamePage extends StatelessWidget {
  GamePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: StopWatch.stopwatchController.stream,
        initialData: 0,
        builder: (context, snapshot) {
          int elapsedTime = snapshot.data as int;
          Duration duration = Duration(milliseconds: elapsedTime);
          String elapsedTimeString =
              '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}.${(duration.inMilliseconds % 1000).toString().padLeft(3, '0')}';
          return Center(
            child: Text('Elapsed time: $elapsedTimeString'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // st.startStopwatch();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ResultPage()));
        },
        child: Icon(Icons.stop),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  ResultPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: StopWatch.stopwatchController.stream,
        initialData: 0,
        builder: (context, snapshot) {
          int elapsedTime = snapshot.data as int;
          Duration duration = Duration(milliseconds: elapsedTime);
          String elapsedTimeString =
              '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}.${(duration.inMilliseconds % 1000).toString().padLeft(3, '0')}';
          return Center(
            child: Text('Final elapsed time: $elapsedTimeString'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          StopWatch.stopStopwatch();
          Navigator.pop(context);
        },
        child: Icon(Icons.stop),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  StreamController<int> _stopwatchController =
      StreamController<int>.broadcast();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => StopwatchPage(),
        '/game': (context) => GamePage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}

void main() => runApp(MyApp());
