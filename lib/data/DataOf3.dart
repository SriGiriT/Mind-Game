import 'package:memory_matrix/components/TilesForGame3.dart';
import 'package:memory_matrix/components/stored_value.dart';

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

class DataOf3 {
  static String timer = "0:00:000";
  DataStorage ds = DataStorage("tile3");
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