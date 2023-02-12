import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch {
  static Timer _timer = 0 as Timer;
  static int _elapsedTime = 0;
  static bool isRuning = false;

  static StreamController<int> stopwatchController =
      StreamController<int>.broadcast();

  static void startStopwatch() {
    isRuning = true;
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      _elapsedTime += 10;
      stopwatchController.add(_elapsedTime);
    });
  }

  static void stopStopwatch() {
    isRuning = false;
    stopwatchController.sink.add(0);
    _elapsedTime = 0;
    _timer.cancel();
  }
}
