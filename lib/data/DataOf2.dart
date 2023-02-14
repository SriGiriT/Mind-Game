import 'dart:math';
import 'package:memory_matrix/components/TilesForGame2.dart';
import 'package:memory_matrix/components/stored_value.dart';

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
class DataOf2 {
  static String timer = "0:00:000";
  DataStorage ds = DataStorage("tile2");
  Future<void> loadData() async {
    timer = await ds.getMyVariable();
  }

  void saveSelecteedPage(String curr) async {
    if (timer == "00:00:000") {
      ds.setMyVariable(curr);
    } else {
      if (curr.compareTo(timer) == -1) {
        timer = curr;
        ds.setMyVariable(curr);
      } else {
        timer = timer;
      }
    }
  }
}