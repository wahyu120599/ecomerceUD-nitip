import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

Future cekonection() async {
  var cek = InternetConnectionChecker();
  var cekconec = await cek.hasConnection;
  var data = "online";
  if (cekconec) {
    // flusbartop(context, "online", Colors.blue);
    return cekconec;
  } else {
    // flusbartop(context, "offline", Colors.blue);
    return cekconec;
  }
}

checkconection() async {
  var cek = InternetConnectionChecker();
  var lisen =
      cek.onStatusChange.listen((InternetConnectionStatus statusconeection) {
    if (statusconeection == true) {
      print("====== offline =====");
    } else {
      print("====== online =====");
    }
  });

  await Future<void>.delayed(const Duration(seconds: 30));

  await lisen.cancel();
  print("cek konection break");
}
