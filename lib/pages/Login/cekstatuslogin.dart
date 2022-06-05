import 'dart:async';

import 'package:flutter/material.dart';

import '../../FuctionHelper/shared/shared.dart';

class Cekstatuslogin extends StatefulWidget {
  const Cekstatuslogin({Key? key}) : super(key: key);

  @override
  State<Cekstatuslogin> createState() => _CekstatusloginState();
}

class _CekstatusloginState extends State<Cekstatuslogin> {
  var shared = Shared();
  _checkloginstatus() async {
    var time = const Duration(seconds: 1);
    return Timer(time, () async {
      var status = await shared.getbool("statuslogin");
      if (status == null) {
        shared.setbool("statuslogin", false);
      }
      if (status == true) {
        Navigator.pushReplacementNamed(context, '/Mainpage');
        // Navigator.pushReplacementNamed(context, '/Login');
      } else {
        Navigator.pushReplacementNamed(context, '/Login');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkloginstatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Colors.amber,
      )),
    );
  }
}
