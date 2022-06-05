import 'package:flutter/material.dart';

Container potocard(double Mediaquerywidth, double Mediaqueryhight, image, id) {
  return Container(
    width: Mediaquerywidth / 3,
    height: Mediaqueryhight / 7,
    margin: EdgeInsets.only(left: 10, right: 10),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
  );
}
