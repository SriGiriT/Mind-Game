import 'dart:math';
import 'package:memory_matrix/components/TilesForGame2.dart';

List<TilesForGame2> getPairs() {
  List<TilesForGame2> pairs = [];
  List<int> list = List<int>.generate(36, (i) => Random().nextInt(2));
  int i = 0;
  while (i < 36) {
    TilesForGame2 temp = new TilesForGame2(false, list[i++]);
    pairs.add(temp);
  }
  return pairs;
}
