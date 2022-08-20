import 'package:flutter/material.dart';

class TilesForGame5 {
  static int score = 0;
  static int totalScore = 0;
  bool isSelected;
  IconData iconToDisplay;
  TilesForGame5(this.isSelected, this.iconToDisplay);

  void setIconData(IconData icondata) {
    iconToDisplay = icondata;
  }

  IconData getIconData() {
    return iconToDisplay;
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
