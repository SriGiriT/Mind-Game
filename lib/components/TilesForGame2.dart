import 'package:flutter/material.dart';
import 'package:memory_matrix/screens/Game5.dart';

class TilesForGame2 {
  static int score = 0;
  static int totalScore = 0;
  bool isSelected;
  int val;
  TilesForGame2(this.isSelected, this.val);

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
