import 'package:memory_matrix/components/TilesForGame1.dart';

List<TilesForGame1> getPairs() {
  List<TilesForGame1> pairs = [];
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int i = 0;
  while (i < 9) {
    TilesForGame1 temp = TilesForGame1(false, list[i++]);
    pairs.add(temp);
  }
  return pairs;
}
