import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:udmurahmotor/FuctionHelper/flusbar.dart';

import '../../FuctionHelper/shared/shared.dart';
import '../../service/registrasi/regserv.dart';

class Otpverified extends StatefulWidget {
  final nama;
  final username;
  final password;
  final email;
  final no_telpon;
  final no_wa;
  // final roltableid;
  const Otpverified(
      {this.nama,
      this.username,
      this.password,
      this.email,
      this.no_telpon,
      this.no_wa,
      Key? key})
      : super(key: key);

  @override
  State<Otpverified> createState() => _OtpverifiedState();
}

class _OtpverifiedState extends State<Otpverified> {
  var regservices = Registrasi();
  var shsred = Shared();
  bool isLoading = false;
  bool isverified = false;

  void regiter(otp, context) async {
    var now = DateTime.now();
    var ran = Random.secure().nextInt(900);
    var username =
        '${ran}${now.microsecond}${now.hour}${now.day}${now.month}${now.year}';
    regservices.Registrasiserv(widget.nama, username, widget.password,
            widget.email, widget.no_telpon, widget.no_wa, "1", otp)
        .then((value) {
      print(value.data?.nama);

      if (value.mesage == "create data sucsess") {
        // shsred.setint("id", value.data?.id);
        // shsred.setstring("nama", value.data?.nama);
        // shsred.setstring("username", value.data?.username);
        // shsred.setstring("email", value.data?.email);
        // shsred.setstring("no_telpon", value.data?.no_telpon);
        // shsred.setstring("no_wa", value.data?.no_wa);
        // shsred.setbool("statuslogin", true);
        setState(() {
          isLoading = false;
        });
        Navigator.pushNamed(context, '/Login');
      } else if (value.mesage == "create data pailed otp notpalid") {
        setState(() {
          isLoading = false;
        });
        flusbartop(context, "Kode otp tidak di kenali", Colors.amber);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color accentPurpleColor = Color(0xFF6A53A1);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3),
                  child: Text("kami telah mengirimkan kode otp ke email anda"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  // padding: EdgeInsets.only(top: 30, bottom: 30),
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      ),
                  child: Text(
                    "KODE OTP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: OtpTextField(
                    keyboardType: TextInputType.visiblePassword,
                    numberOfFields: 6,
                    borderColor: Colors.black,
                    focusedBorderColor: Colors.black,
                    // styles: otpTextStyles,
                    showFieldAsBox: false,
                    borderWidth: 4.0,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here if necessary
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      print(verificationCode);
                      setState(() {
                        isLoading = true;
                      });
                      // Timer(Duration(seconds: 5), () {
                      //   setState(() {
                      //     isLoading = false;
                      //   });
                      // });
                      regiter(verificationCode, context);
                    },
                  ),
                ),
              ],
            ),
          ),
          (isLoading == true)
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black38,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
