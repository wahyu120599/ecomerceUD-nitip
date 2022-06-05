// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udmurahmotor/FuctionHelper/flusbar.dart';

import '../../service/registrasi/regserv.dart';
import 'otpverified.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final namecontroler = TextEditingController();
  final emailcontroler = TextEditingController();
  final telponcontroler = TextEditingController();
  final watshappcontroler = TextEditingController();
  final passwordcontroler = TextEditingController();
  final ulangipaswordcontroler = TextEditingController();
  final _form = GlobalKey<FormState>();
  var registrsiserv = Registrasi();
  bool isloadingdata = false;

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      registrsiserv.createOtpserv(emailcontroler.text).then((value) {
        if (value["mesage"] == "succes sending update otp" ||
            value["mesage"] == "succes sending otp") {
          setState(() {
            isloadingdata = false;
          });
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return Otpverified(
              nama: namecontroler.text,
              email: emailcontroler.text,
              no_telpon: telponcontroler.text,
              no_wa: watshappcontroler.text,
              password: passwordcontroler.text,
            );
          }));
          setState(() {
            isloadingdata = false;
          });
          succesotpsend(context);
        } else if (value['mesage'] == 'user al ready exis') {
          setState(() {
            isloadingdata = false;
          });
          flusbartop(context, "email sudah terdaptar", Colors.amber);
        } else {
          setState(() {
            isloadingdata = false;
          });
          flusbartop(context, "email eror gunakan email yang lain", Colors.red);
        }
      });
      // postfaild(context);
      // setState(() {
      //   isloadingdata = false;
      // });
    } else {
      setState(() {
        isloadingdata = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var Medquerywidth = MediaQuery.of(context).size.width;
    var Medqueryhight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Form(
            key: _form,
            child: ListView(
              padding: EdgeInsets.only(top: 70, left: 20, right: 20),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Registrasi akun ud murah motor",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Formfield(
                    lable: "Nama Lengkap",
                    controller: namecontroler,
                    type: "name"),
                SizedBox(
                  height: 20,
                ),
                Formfield(
                  lable: "Email",
                  controller: emailcontroler,
                  type: "email",
                ),
                SizedBox(
                  height: 20,
                ),
                Formfield(
                  lable: "No Telpon",
                  controller: telponcontroler,
                  type: "number",
                ),
                SizedBox(
                  height: 20,
                ),
                Formfield(
                  lable: "No Watshapp",
                  controller: watshappcontroler,
                  type: "number",
                ),
                SizedBox(
                  height: 20,
                ),
                Formfield(
                  lable: "Password",
                  controller: passwordcontroler,
                  pscontrol: passwordcontroler.text,
                  ulpscontrol: ulangipaswordcontroler.text,
                  type: "password",
                ),
                SizedBox(
                  height: 20,
                ),
                Formfield(
                  lable: "Validasi password",
                  controller: ulangipaswordcontroler,
                  pscontrol: passwordcontroler.text,
                  ulpscontrol: ulangipaswordcontroler.text,
                  type: "Validasi password",
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, '/Mainpage');

                    setState(() {
                      isloadingdata = true;
                    });
                    if (namecontroler.text.isNotEmpty &&
                        emailcontroler.text.isNotEmpty &&
                        telponcontroler.text.isNotEmpty &&
                        watshappcontroler.text.isNotEmpty &&
                        passwordcontroler.text.isNotEmpty &&
                        ulangipaswordcontroler.text.isNotEmpty) {
                      // var isvalid = _form.currentState!();

                      ///
                      _saveForm();

                      ///
                    } else {
                      setState(() {
                        isloadingdata = false;
                      });
                      emtyform(context);
                    }
                  },
                  child: Container(
                    height: Medqueryhight / 15,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Registrasi",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          (isloadingdata == true)
              ? Container(
                  width: Medquerywidth,
                  height: Medqueryhight,
                  color: Colors.black26,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.amber,
                  )),
                )
              : Container()
        ],
      ),
    );
  }
}

class Formfield extends StatefulWidget {
  final controller;
  final lable;
  final type;
  final pscontrol;
  final ulpscontrol;
  const Formfield({
    this.pscontrol,
    this.ulpscontrol,
    this.type,
    this.controller,
    this.lable,
    Key? key,
  }) : super(key: key);

  @override
  State<Formfield> createState() => _FormfieldState();
}

class _FormfieldState extends State<Formfield> {
  bool showpass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (widget.type == "password") {
          if (!(text!.length > 5) && text.isNotEmpty) {
            return "password harus 6 karak ter atau lebih";
          } else if (!text.contains(RegExp(r'[a-z]')) ||
              !text.contains(RegExp(r'[A-Z]'))) {
            return "setidak nya berisi satu karakter hurup besar dan hurup kecil";
          } else {
            return null;
          }
        } else if (widget.type == "Validasi password") {
          if (widget.pscontrol != widget.ulpscontrol) {
            return "harus sama persis dengan password";
          }
        } else if (widget.type == "email") {
          if (!text!.contains(RegExp(r'[@]'))) {
            return "masukan email dengan benar contoh example@gmal.com";
          }
        }
      },
      keyboardType: (widget.type == "password")
          ? TextInputType.visiblePassword
          : (widget.type == "number")
              ? TextInputType.phone
              : (widget.type == "email")
                  ? TextInputType.emailAddress
                  : (widget.type == "Validasi password")
                      ? TextInputType.visiblePassword
                      : TextInputType.text,
      obscureText:
          (widget.type == "password" || widget.type == "Validasi password")
              ? showpass
              : false,
      controller: widget.controller,
      decoration: InputDecoration(
          suffixIcon:
              (widget.type == "password" || widget.type == "Validasi password")
                  ? IconButton(
                      onPressed: () {
                        if (showpass == true) {
                          setState(() {
                            showpass = false;
                          });
                        } else {
                          setState(() {
                            showpass = true;
                          });
                        }
                      },
                      icon: Icon(Icons.remove_red_eye_outlined,
                          color: showpass ? Colors.amber : Colors.black38))
                  : null,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: "${widget.lable} . . .",
          labelText: widget.lable,
          labelStyle: TextStyle(color: Colors.black)),
    );
  }
}
