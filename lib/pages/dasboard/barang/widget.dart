import 'package:flutter/material.dart';

Dialogcreate(context) {
  return showDialog(
    context: context,
    builder: (context) => Center(
      child: Container(
          width: MediaQuery.of(context).size.width / 1.4,
          // height: MediaQuery.of(context).size.height / 4,
          child: AlertDialog(
              content: SingleChildScrollView(
                  child: Column(children: <Widget>[
            Text(
              "How Would You Rate Our App?",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextField()
          ])))),
    ),
  );
}
