import 'package:flutter/material.dart';
import 'package:udmurahmotor/FuctionHelper/flusbar.dart';

import '../../../model/getkomfir.dart';
import '../../../service/komfirmasibayar/komfirmasi.dart';
import '../appbar.dart';
import '../sidebar.dart';

class Komfirmasi extends StatefulWidget {
  const Komfirmasi({Key? key}) : super(key: key);

  @override
  State<Komfirmasi> createState() => _KomfirmasiState();
}

class _KomfirmasiState extends State<Komfirmasi> {
  final namacontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final no_wacontroller = TextEditingController();
  final no_telponcontroller = TextEditingController();
  final _keyform = GlobalKey<FormState>();
  bool _isLoading = false;
  final komfir = Komfirmasibayar();

  List<Komfirdata> d = [];

  _getkom() {
    komfir.getkomfir().then((value) {
      if (value.message == "get data sucsess") {
        print(value);
        print("hahahahaha");
        value.data?.forEach((v) {
          setState(() {
            d.add(v);
          });
        });
      } else {
        print("ada yang salah");
      }
    });
  }

  _save([id]) {
    final isValid = _keyform.currentState!.validate();
    if (isValid) {
      print("save");
      if (d.isEmpty) {
        komfir
            .cretekomfir(namacontroller.text, emailcontroller.text,
                no_wacontroller.text, no_telponcontroller.text)
            .then((value) {
          if (value.message == "create data sucsess") {
            Navigator.pop(context);
            flusbartop(context, "${namacontroller.text} berhasil dibuat",
                Colors.green);
            _getkom();
          }
        });
      } else {
        komfir
            .updatekomfir(namacontroller.text, emailcontroller.text,
                no_wacontroller.text, no_telponcontroller.text, id)
            .then((value) {
          if (value["mesage"] == "update data sucsess") {
            d.clear();
            _getkom();
            flusbartop(context, "sukses update data", Colors.green);
          }
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _formvalue() {
    if (d.isNotEmpty) {
      namacontroller.text = d[0].nama.toString();
      emailcontroller.text = d[0].email.toString();
      no_wacontroller.text = d[0].no_wa.toString();
      no_telponcontroller.text = d[0].no_telpon.toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getkom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Sidebar(),
        appBar: dsboardappbar(context),
        body: (d.isNotEmpty)
            ? Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: d.length,
                  itemBuilder: (context, index) {
                    return datacomfirm(context, d[index].nama, d[index].email,
                        d[index].no_telpon, d[index].no_wa, d[index].id);
                  },
                ),
              )
            : Container(
                padding: EdgeInsets.all(10),
                child: datacomfirm(
                  context,
                  "belum ada",
                  "@belumada.com",
                  "08..",
                  "08..",
                ),
              ));
  }

  Container datacomfirm(BuildContext context, nama, email, no_telp, no_wa,
      [id]) {
    return Container(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "nama : ${nama}",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 5),
                Text("email : ${email}", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Text("no_wa : ${no_wa}", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Text("no_telpon : ${no_telp}", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              _formvalue();
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        scrollable: true,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        content: Form(
                          key: _keyform,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2.5,
                            child: ListView(
                              children: [
                                TextFormField(
                                  controller: namacontroller,
                                  // initialValue: "sasa",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "wajib di isi";
                                    } else {
                                      return null;
                                    }
                                  },
                                  // controller: usernamecontroler,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      hintText: "nama . . .",
                                      labelText: "Nama",
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  // initialValue: "sasa",
                                  controller: emailcontroller,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "wajib di isi";
                                    } else {
                                      return null;
                                    }
                                  },
                                  // controller: usernamecontroler,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      hintText: "email . . .",
                                      labelText: "email",
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  // initialValue: "sasa",
                                  controller: no_wacontroller,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "wajib di isi";
                                    } else {
                                      return null;
                                    }
                                  },
                                  // controller: usernamecontroler,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      hintText: "No_wa . . .",
                                      labelText: "no_wa",
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  // initialValue: "sasa",
                                  controller: no_telponcontroller,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "wajib di isi";
                                    } else {
                                      return null;
                                    }
                                  },
                                  // controller: usernamecontroler,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      hintText: "No_telpon . . .",
                                      labelText: "no_telpon",
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    _save(id);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.black),
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          right: 20,
                                          left: 20),
                                      child: Center(
                                        child: Text(
                                          "simpan",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
            },
            child: Container(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 25, right: 25),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  "setdata",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
