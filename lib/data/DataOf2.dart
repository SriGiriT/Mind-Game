import 'dart:math';
import 'package:memory_matrix/components/TilesForGame2.dart';

List<TilesForGame2> getPairs() {
  List<TilesForGame2> pairs = [];
  List<int> list = List<int>.generate(16, (i) => Random().nextInt(2));
  int i = 0;
  while (i < 16) {
    TilesForGame2 temp = new TilesForGame2(false, list[i++], false);
    pairs.add(temp);
  }
  return pairs;
}
