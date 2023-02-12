class TilesForGame1 {
  static int score = 0;
  static int totalScore = 0;
  bool isSelected;
  int val;
  static String timer = "";
  static int isFirst = 0;
  TilesForGame1(this.isSelected, this.val);

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
    int n = 10;
    while (n-- > 0) {
      score--;
    }
  }

  static int getTotalScore() {
    return totalScore;
  }
}
