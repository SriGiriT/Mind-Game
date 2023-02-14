import 'package:memory_matrix/components/stored_value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TilesForGame3 {
    static String timer = "0:00:000";
  DataStorage ds = DataStorage("tile3");
  @override
  void initState() async {
    timer = await ds.getMyVariable();
  }
  static int score = 0;
  static int totalScore = 0;
  bool isSelected;
  int val;
  static int isFirst = 0;
  TilesForGame3(this.isSelected, this.val);

  void setIconData(int va) {
    val = va;
  }

  int getIconData() {
    return val;
  }

  void setIsSelected(bool getIsSelected) {
    isSelected = getIsSelected;
  }

  bool getIsSelected() {
    return isSelected;
  }

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
