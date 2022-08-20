import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memory_matrix/components/TilesForGame5.dart';

List<IconData> list = [
  Icons.ac_unit,
  Icons.accessibility,
  Icons.account_balance,
  Icons.account_balance_wallet,
  Icons.account_box,
  Icons.account_tree,
  Icons.ad_units,
  Icons.add_a_photo,
  Icons.call,
  Icons.dangerous,
  Icons.delete,
  Icons.comment,
  Icons.home,
  Icons.call,
  Icons.bluetooth,
  Icons.location_city,
  Icons.add_reaction_sharp,
  Icons.help,
  Icons.shopping_cart,
  Icons.airplanemode_active,
  Icons.android,
  Icons.anchor_sharp,
  Icons.apple,
  Icons.apps,
  Icons.archive,
  Icons.arrow_back,
  Icons.architecture,
  Icons.movie,
  Icons.run_circle,
  Icons.local_taxi,
  Icons.animation,
  Icons.motorcycle,
  Icons.fullscreen,
  Icons.favorite,
  Icons.person,
  Icons.timelapse,
  Icons.lock,
  Icons.info,
  Icons.photo,
  Icons.gamepad,
  Icons.laptop,
  Icons.pie_chart,
  Icons.grade,
  Icons.zoom_in,
  Icons.input
];
List<TilesForGame5> getPairs() {
  List<TilesForGame5> pairs = [];
  int n = 8;
  final numberss = Set<int>();
  while (numberss.length < 8) {
    numberss.add(Random().nextInt(list.length));
  }
  List<int> number = numberss.toList();
  int i = 0;
  while (n-- > 0) {
    IconData temp = list[number[i++]];
    TilesForGame5 tileModel = new TilesForGame5(false, temp);
    pairs.add(tileModel);
    tileModel = new TilesForGame5(false, temp);
    pairs.add(tileModel);
  }
  return pairs;
}
