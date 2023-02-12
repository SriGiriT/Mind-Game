import 'package:flutter/material.dart';
import 'dart:async';

import 'package:memory_matrix/components/TilesForGame1.dart';

class StopWatch {
  static Timer _timer = StopWatch._timer;
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
    _timer.cancel();
  }
}
