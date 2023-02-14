import 'package:memory_matrix/components/stored_value.dart';

class DataOf4 {
  static String timer = "0:00:000";
  DataStorage ds = DataStorage("tile4");
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
  static int totalScore = 0;
  static int score = 0;
  void addScore() {
    score++;
  }

  int getScore() {
    return score;
  }

  void resetScore() {
    totalScore++;
    score = 0;
  }

  static int getTotalScore() {
    return totalScore;
  }
}
