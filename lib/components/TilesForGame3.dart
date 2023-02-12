class TilesForGame3 {
  static int score = 0;
  static int totalScore = 0;
  bool isSelected;
  int val;
  static String timer = "0:00:000";
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
}
