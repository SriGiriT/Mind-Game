class Score {
  List<int> score = [
    0,
    0,
    0,
    0,
    0,
  ];
  List<int> count = [
    1,
    1,
    1,
    1,
    1,
  ];
  void addScore(int game) {
    score[game]++;
    count[game] = 1;
  }

  void resetScore(int game) {
    score[game] = 0;
    count[game] = 1;
  }

  int getScore(int game) {
    return score[game];
  }
}
