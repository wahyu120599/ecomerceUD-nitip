import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

emtyform(context) {
  Flushbar(
    margin: EdgeInsets.all(5),
    flushbarPosition: FlushbarPosition.TOP,
    message: "isi semua fields dengan benar",
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.amber,
    ),
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.amber,
  )..show(context);
}

postfaild(context) {
  Flushbar(
    margin: EdgeInsets.all(5),
    flushbarPosition: FlushbarPosition.TOP,
    message: "tejadi kesalaha coba ulangi",
    icon: Icon(
      Icons.warning_outlined,
      size: 28.0,
      color: Colors.red,
    ),
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.red,
  )..show(context);
}

deletefaild(context) {
  Flushbar(
    margin: EdgeInsets.all(5),
    flushbarPosition: FlushbarPosition.TOP,
    message: "ups! terjadi kesalahn",
    icon: Icon(
      Icons.warning_outlined,
      size: 28.0,
      color: Colors.amber,
    ),
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.amber,
  )..show(context);
}

successcreated(context) {
  Flushbar(
    margin: EdgeInsets.all(5),
    flushbarPosition: FlushbarPosition.TOP,
    message: "sukses membuat data",
    icon: Icon(
      Icons.check_circle_outline,
      size: 28.0,
      color: Colors.green,
    ),
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.green,
  )..show(context);
}

succesdeleted(context) {
  Flushbar(
    margin: EdgeInsets.all(5),
    flushbarPosition: FlushbarPosition.TOP,
    message: "sukses hapus data",
    icon: Icon(
      Icons.rice_bowl_rounded,
      size: 28.0,
      color: Colors.green,
    ),
    duration: Duration(seconds: 3),
    leftBarIndicatorColor: Colors.green,
  )..show(context);
}

successupdaed(context) {
  Flushbar(
    margin: EdgeInsets.all(5),
    flushbarPosition: FlushbarPosition.TOP,
    message: "sukses update",
    icon: Icon(
      Icons.rice_bowl_rounded,
      size: 28.0,
      color: Colors.green,
    ),
    duration: Duration(seconds: 7),
    leftBarIndicatorColor: Colors.green,
  )..show(context);
}

succesotpsend(context) {
  Flushbar(
    margin: EdgeInsets.all(5),
    flushbarPosition: FlushbarPosition.TOP,
    message: "kode otp sudah di kirim ke email anda",
    icon: Icon(
      Icons.rice_bowl_rounded,
      size: 28.0,
      color: Colors.green,
    ),
    duration: Duration(seconds: 7),
    leftBarIndicatorColor: Colors.green,
  )..show(context);
}

flusbartop(context, text, color) {
  Flushbar(
    margin: EdgeInsets.all(5),
    flushbarPosition: FlushbarPosition.TOP,
    message: text,
    icon: Icon(
      Icons.rice_bowl_rounded,
      size: 28.0,
      color: color,
    ),
    duration: Duration(seconds: 10),
    leftBarIndicatorColor: color,
  )..show(context);
}
