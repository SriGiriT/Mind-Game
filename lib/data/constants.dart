import 'package:flutter/material.dart';

TextStyle small_text = TextStyle(
    fontSize: 20,
    fontFamily: "Roboto",
    fontWeight: FontWeight.normal,
    color: Colors.black);

TextStyle large_text = TextStyle(
    fontSize: 24,
    fontFamily: "Roboto",
    fontWeight: FontWeight.bold,
    color: Colors.black);

Color button_color = Colors.white;
Color box_color = Colors.white;

Future<bool> onBackPressed(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Do you really want to exit the level?"),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text("No"),
        ),
        FlatButton(
          onPressed: () =>
              Navigator.popUntil(context, ModalRoute.withName('/')),
          child: Text("Yes"),
        ),
      ],
    ),
  ).then((value) => value ?? false);
}
