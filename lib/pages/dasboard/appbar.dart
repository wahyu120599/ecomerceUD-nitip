import 'package:flutter/material.dart';

AppBar dsboardappbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/Mainpage");
          },
          icon: Icon(
            Icons.home,
            color: Colors.white,
            size: 27,
          ))
    ],
  );
}
