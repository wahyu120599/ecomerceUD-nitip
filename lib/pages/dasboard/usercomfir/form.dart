import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udmurahmotor/FuctionHelper/flusbar.dart';

import '../../../service/komfirmasibayar/komfirmasi.dart';

class Formdata extends StatefulWidget {
  int? id;
  String? isUpdate;
  String? email;
  String? no_wa;
  String? no_telpon;
  Formdata(
      {Key? key,
      this.id,
      required this.isUpdate,
      this.email,
      this.no_wa,
      this.no_telpon})
      : super(key: key);

  @override
  State<Formdata> createState() => _FormdataState();
}

class _FormdataState extends State<Formdata> {
  final wacontroler = TextEditingController();
  final emailcontroler = TextEditingController();
  final telponcontroler = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool checkboxValue = false;
  bool isloading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.email != "" && widget.no_wa != "") {
      setState(() {
        wacontroler.text = widget.no_wa!;
        emailcontroler.text = widget.email!;
        telponcontroler.text = widget.no_telpon!;
      });
    }
  }

  var kofirservice = Komfirmasibayar();
  _update() {
    final isValidupdate = _form.currentState!.validate();
    if (isValidupdate) {
      kofirservice
          .updatekomfir(
              "",
              emailcontroler.text,
              wacontroler.text,
              (checkboxValue == true) ? wacontroler.text : telponcontroler.text,
              widget.id)
          .then((value) {
        if (value["mesage"] == "update data sucsess") {
          Navigator.pushNamed(context, "/Dasbord");
          flusbartop(context, value["mesage"], Colors.green);
        } else {
          flusbartop(context, "ada masalah", Colors.red);
        }
      });
    }
  }

  _create() {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      kofirservice
          .cretekomfir("", emailcontroler.text, wacontroler.text,
              (checkboxValue == true) ? wacontroler.text : telponcontroler.text)
          .then((value) {
        if (value["mesage"] == "create data sucsess") {
          Navigator.pushNamed(context, "/Dasbord");
          flusbartop(context, "sukkses", Colors.green);
        } else {
          flusbartop(context, "ada masalah", Colors.red);
        }
      });

      print(emailcontroler.text);
      print(wacontroler.text);
      print(telponcontroler.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
            // height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Color.fromARGB(255, 255, 119, 7),
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.7,
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(right: 30, left: 30),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(5)),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    formfield(
                      context,
                      emailcontroler,
                      "Email",
                      (value) {
                        if (value!.isEmpty) {
                          return "wajib di isi";
                        } else if (!value.contains(RegExp(r'[@]'))) {
                          return "example@gmail.com";
                        } else {
                          return null;
                        }
                      },
                    ),
                    formfield(
                      context,
                      wacontroler,
                      "Whatshapp",
                      (value) {
                        if (value!.isEmpty) {
                          return "wajib di isi";
                        } else if (!value.contains(RegExp(r'[+]'))) {
                          return "+62...";
                        } else {
                          return null;
                        }
                      },
                    ),
                    CheckboxListTile(
                        value: checkboxValue,
                        checkColor: Colors.amber,
                        activeColor: Colors.black,
                        title: Text(
                          "no telpon sama dengan no wa",
                          style: TextStyle(fontSize: 15),
                        ),
                        // subtitle: Text("no telpon sama dengan no wa"),
                        onChanged: (v) {
                          print(v);
                          if (wacontroler.text.isNotEmpty) {
                            setState(() {
                              checkboxValue = v as bool;
                            });
                          }
                        }),
                    formfield(
                      context,
                      (checkboxValue == true) ? wacontroler : telponcontroler,
                      "telpon",
                      (value) {
                        if (value!.isEmpty) {
                          return "wajib di isi";
                        } else if (!value.contains(RegExp(r'[+]'))) {
                          return "+62...";
                        } else {
                          return null;
                        }
                      },
                    ),
                    InkWell(
                      onTap: () {
                        if (widget.isUpdate == "UPDATE") {
                          FocusManager.instance.primaryFocus?.unfocus();
                          _update();
                        } else {
                          FocusManager.instance.primaryFocus?.unfocus();
                          _create();
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 17,
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            widget.isUpdate.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Container formfield(BuildContext context, controler, name, validator) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      // height: MediaQuery.of(context).size.height / 20,
      child: TextFormField(
        keyboardType: (name != "Email")
            ? TextInputType.phone
            : TextInputType.emailAddress,
        // initialValue: controler.text,
        controller: controler,
        validator: validator,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: "${name} . . .",
            labelText: name,
            labelStyle: TextStyle(color: Colors.black)),
      ),
    );
  }
}
