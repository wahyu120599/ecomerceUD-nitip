import 'dart:async';

import 'package:flutter/material.dart';
import 'package:udmurahmotor/pages/Detail/widget.dart';

import '../../FuctionHelper/flusbar.dart';
import '../../FuctionHelper/shared/shared.dart';
import '../../model/getkelengkapan.dart';
import '../../model/getpotobarang.dart';
import '../../service/kelengkapan.dart';
import '../../service/order/add.dart';
import '../../service/potobarang/getpotobarang.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.params}) : super(key: key);
  final params;
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var poto = Getpoto();
  var kelengkapan = Kelengkapanservice();
  var order = Addbarang();
  var shared = Shared();

  List<Datapotobarang> potobarang = [];
  List<Datakelengkapan> kelengkapanbarang = [];

  _gekelengkapan() {
    kelengkapan.getkelengkapan(widget.params["id"]).then((value) {
      if (value.isNotEmpty) {
        value.forEach((v) {
          setState(() {
            kelengkapanbarang.add(v);
          });
        });
      }
    });
  }

  _getpoto() {
    poto.getpotobarang(widget.params["id"]).then((value) {
      if (value.isNotEmpty) {
        value.forEach((v) {
          setState(() {
            potobarang.add(v);
          });
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    _getpoto();
    _gekelengkapan();
  }

  @override
  Widget build(BuildContext context) {
    var Mediaqueryhight = MediaQuery.of(context).size.height;
    var Mediaquerywidth = MediaQuery.of(context).size.width;
    print("isis paramsss :${widget.params}");
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: Mediaquerywidth,
            height: Mediaqueryhight - 60,
            // color: Colors.black,
            child: ListView(
              children: [
                Container(
                  width: Mediaquerywidth,
                  height: Mediaqueryhight / 2.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.params["thumnails"]),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // gambar
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            widget.params["nama"],
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                      //kelengkapan
                      Text(
                        "Kelengkapan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: Mediaquerywidth,
                        height: Mediaqueryhight - 790,
                        margin: EdgeInsets.only(top: 5, bottom: 20),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: kelengkapanbarang.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(kelengkapanbarang[index]
                                      .dpkument
                                      .toString()),
                                ),
                              );
                            }),
                      ),
                      //keterangan
                      Text(
                        "keterangan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(widget.params["keterangan"])),
                      //gambar
                      Container(
                        width: Mediaquerywidth,
                        height: Mediaqueryhight / 7,
                        margin: EdgeInsets.only(top: 15),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: potobarang.length,
                            itemBuilder: (context, index) {
                              return potocard(
                                  Mediaquerywidth,
                                  Mediaqueryhight,
                                  potobarang[index].imagepath,
                                  potobarang[index].id);
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: Mediaquerywidth,
            height: 60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.params["harga"].toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                InkWell(
                  onTap: () async {
                    ///
                    var userid = await shared.getint("id");
                    order
                        .creteorder(widget.params['id'], userid, 2, "")
                        .then((value) {
                      if (value['mesage'] == "create data sucsess") {
                        flusbartop(context, "oder berhasil", Colors.green);
                      } else if (value["mesage"] == "oder status create") {
                        flusbartop(context, "lihat keranjang", Colors.green);
                      } else {
                        flusbartop(context, "gagal", Colors.amber);
                      }
                    });

                    ///
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // ignore: prefer_const_constructors
                            content: Container(
                              width: Mediaquerywidth / 1.5,
                              height: Mediaquerywidth / 1.5,
                              child: Center(
                                // ignore: prefer_const_constructors
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Success",
                                      style: TextStyle(color: Colors.green),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                    Timer(Duration(seconds: 1), () {
                      Navigator.pushNamed(context, "/Mainpage",
                          arguments: {"from": "Details"});
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 30, left: 30),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "bayar",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
