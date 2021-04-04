import 'package:flutter/material.dart';

void jumpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text("Jump duck")),
        content: new Text(
            "This is a free game to practice knowledge in games\n\n\nAlexandre Alves"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: Icon(
              Icons.close,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
