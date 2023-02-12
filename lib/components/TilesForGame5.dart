import 'package:flutter/material.dart';

class TilesForGame5 {
  static int score = 0;
  static int totalScore = 0;
  bool isSelected;
  static String timer = "0:00:000";
  static int isFirst = 0;
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
    score = 0;
  }

  static int getTotalScore() {
    return totalScore;
  }
}
