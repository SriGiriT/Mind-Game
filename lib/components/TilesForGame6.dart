class TilesForGame6 {
  static int score = 0;
  static int totalScore = 0;
  static String timer = "0:00:000";
  static int isFirst = 0;

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
