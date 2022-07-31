import 'package:flutter/material.dart';

class Sizemedia {
  hight(context, pembagi) {
    return MediaQuery.of(context).size.height / pembagi;
  }

  width(context, pembagi) {
    return MediaQuery.of(context).size.width / pembagi;
  }
}
