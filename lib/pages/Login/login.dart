// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:udmurahmotor/FuctionHelper/flusbar.dart';

import '../../FuctionHelper/shared/shared.dart';
import '../../service/login/loginserv.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernamecontroler = TextEditingController();
  final passwordcontroler = TextEditingController();
  final _form = GlobalKey<FormState>();
  var shared = Shared();
  var loginservice = Loginservice();
  bool isLoading = false;
  bool scure = true;

  _login() {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      setState(() {
        isLoading = true;
      });
      loginservice
          .loginerv(usernamecontroler.text, passwordcontroler.text)
          .then((value) {
        if (value.mesage == "login succes") {
          shared.setint("id", value.data?.id);
          shared.setint("RoltableId", value.data?.id);
          shared.setstring("nama", value.data?.nama);
          shared.setstring("username", value.data?.username);
          shared.setstring("email", value.data?.email);
          shared.setstring("no_telpon", value.data?.no_telpon);
          shared.setstring("no_wa", value.data?.no_wa);
          shared.setbool("statuslogin", true);
          shared.setstring("token", value.acces_token);
          flusbartop(context, "loginsukses", Colors.green);
          // print(value.data?.RoltableId.runtimeType);
          setState(() {
            isLoading = false;
          });
          Navigator.pushReplacementNamed(context, '/Mainpage');
        } else if (value.mesage == "login pailed") {
          setState(() {
            isLoading = false;
          });
          flusbartop(context, "login gagal", Colors.amber);
        } else {
          setState(() {
            isLoading = false;
          });
          flusbartop(context, "login gagal", Colors.red);
        }
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
              padding: EdgeInsets.only(
                  top: Medqueryhight / 4.9, left: 20, right: 20),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 70),
                  child: Text(
                    "ud murah motor",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "wajib di isi";
                    } else {
                      return null;
                    }
                  },
                  controller: usernamecontroler,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Username . . .",
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "wajib di isi";
                    } else {
                      return null;
                    }
                  },
                  obscureText: (scure) ? true : false,
                  controller: passwordcontroler,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (scure == true) {
                                scure = false;
                              } else {
                                scure = true;
                              }
                            });
                          },
                          icon: Icon(Icons.remove_red_eye_outlined,
                              color: (scure) ? Colors.amber : Colors.black54)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Password . . .",
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    _login();
                  },
                  child: Container(
                    height: Medqueryhight / 15,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Belumpunya accout "),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/Register");
                        },
                        child: Text(
                          "Registrasi",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          (isLoading == true)
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black38,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.amber),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
