// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udmurahmotor/core/matrialwiget/materialcolor.dart';

import '../apicontroller/transaksicontroller.dart';

class Bayar extends StatefulWidget {
  const Bayar({Key? key}) : super(key: key);

  @override
  State<Bayar> createState() => _BayarState();
}

class _BayarState extends State<Bayar> {
  List<int> sourcutdata = [10, 20, 50, 100, 200, 300, 400, 500];
  final jumlahconroller = TextEditingController();

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Transaksikontroller transaksikontroller = Get.put(Transaksikontroller());
    return Obx(
      () => Scaffold(
        body: Container(
          color: Colordata().bodycolors,
          width: width,
          height: height,
          padding: EdgeInsets.all(5),
          child: ListView(
            children: [
              Container(
                width: width,
                height: height / 10,
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Total Belanja",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Rp.${transaksikontroller.total}",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              //barang belajaan
              Container(
                width: width,
                height: height / 4,
                padding: EdgeInsets.only(bottom: 5, top: 5),
                // color: Colors.blue,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: transaksikontroller.datayouwant.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 7, right: 7),
                      width: width / 2.3,
                      height: height / 3.1,
                      // color: Colors.amber,
                      child: Stack(
                        children: [
                          Container(
                            width: width / 2.3,
                            height: height / 3.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black26,
                                image: DecorationImage(
                                    image: NetworkImage(transaksikontroller
                                        .datayouwant[index].poto
                                        .toString()),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            width: width / 2.3,
                            height: height / 3.1,
                            child: Text(
                              "${transaksikontroller.datayouwant[index].name}",
                              style: TextStyle(color: Colordata().texcolors),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Form(
                key: _form,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                  margin: EdgeInsets.only(left: 70, right: 70, top: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "tidak boleh kosong";
                      } else if (int.parse(jumlahconroller.text) <
                          int.parse(transaksikontroller.total.toString())) {
                        return "jumlah pembayaran tidak sesui";
                      } else {
                        return null;
                      }
                    },
                    onFieldSubmitted: (v) {
                      final isValid = _form.currentState!.validate();
                      if (isValid) {
                        transaksikontroller.postbulk();
                        if (transaksikontroller.statustransaksi.isTrue) {
                          print("suksess");
                        }
                      }
                    },
                    controller: jumlahconroller,
                    onChanged: (v) {
                      if (v.isNotEmpty) {
                        var titik = v.split(".");
                        var join1 = titik.join("");
                        var koma = join1.split(",");
                        var joind2 = koma.join("");
                        transaksikontroller.kakulasikembalian(
                            transaksikontroller.total, int.parse(joind2));
                      }
                    },
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.amber)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.amber),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.amberAccent),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (transaksikontroller.kembalian < 0)
                        ? "Kembalian Rp.0 "
                        : "Kembalian Rp.${transaksikontroller.kembalian}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                child: (transaksikontroller.statustransaksi.isTrue)
                    ? Text(
                        "kode Transaksi:${transaksikontroller.kodetransaksi}",
                        style: TextStyle(color: Colors.amber),
                      )
                    : Text("kode:"),
              ),

              Container(
                width: width,
                height: height / 11,
                margin: EdgeInsets.only(top: 30),
                // color: Colors.amber,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sourcutdata.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          transaksikontroller.sourcut(
                              jumlahconroller, sourcutdata[index]);
                        },
                        child: Container(
                          width: width / 5,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: Color.fromARGB(110, 255, 255, 255))),
                          child: Center(
                            child: Text(
                              "Rp.${sourcutdata[index]} Rb",
                              style: TextStyle(color: Colordata().texcolors),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
