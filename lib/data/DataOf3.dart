import 'package:memory_matrix/components/TilesForGame3.dart';

List<TilesForGame3> getPairs() {
  List<TilesForGame3> pairs = [];
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int i = 0;
  while (i < 9) {
    TilesForGame3 temp = new TilesForGame3(false, list[i++]);
    pairs.add(temp);
  }
  return pairs;
}
