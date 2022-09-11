class TilesForGame6 {
  static int score = 0;
  static int totalScore = 0;

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
