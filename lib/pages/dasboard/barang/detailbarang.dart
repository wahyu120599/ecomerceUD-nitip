import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udmurahmotor/pages/dasboard/barang/kelengkapan.dart';
import 'package:udmurahmotor/pages/dasboard/barang/potobarang.dart';
import 'package:udmurahmotor/pages/dasboard/barang/widget.dart';

import '../../../service/potobarang/getpotobarang.dart';
import '../../../service/kelengkapan.dart';
import '../../../service/potobarang/postpotobarang.dart';

class Detailbarang extends StatefulWidget {
  const Detailbarang(
      {Key? key,
      this.namabarang,
      this.harga,
      this.no_plat,
      this.keterangan,
      this.thumnails,
      this.kategoribarangId,
      this.id})
      : super(key: key);
  final id;
  final namabarang;
  final harga;
  final no_plat;
  final keterangan;
  final thumnails;
  final kategoribarangId;
  @override
  State<Detailbarang> createState() => _DetailbarangState();
}

class _DetailbarangState extends State<Detailbarang> {
  List<Widget> datapoto = [];
  List<Widget> kelengkapanbarang = [];
  var getpoto = Getpoto();
  var kelengkapan = Kelengkapanservice();

  getpotoservice() {
    getpoto.getpotobarang(widget.id).then((value) {
      value.forEach((v) {
        // print(v.imagepath);
        setState(() {
          datapoto.add(Viewimage(
            image: v.imagepath,
            id: v.id,
          ));
        });
      });
    });
  }

  gekelengkapanserv() {
    kelengkapan.getkelengkapan(widget.id).then((value) {
      value.forEach((x) {
        print("kelengkapan");
        print(x.dpkument);
        setState(() {
          kelengkapanbarang.add(Viewkwlengkapan(
            dokument: x.dpkument,
            id: x.id,
          ));
        });
      });
    });
  }

  // getkelengkapan(){
  //   kelengkapan.postkelengkapan(dokumen, barangid)
  // }

  Future refreshData() async {
    datapoto.clear();
    kelengkapanbarang.clear();
    gekelengkapanserv();
    getpotoservice();
    kelengkapanbarang.add(Kelengkapanvew(
      id: widget.id,
    ));
    datapoto.add(Createpoto(
      id: widget.id,
    ));
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gekelengkapanserv();
    getpotoservice();
    kelengkapanbarang.add(Kelengkapanvew(
      id: widget.id,
    ));
    datapoto.add(Createpoto(
      id: widget.id,
    ));
  }

  @override
  Widget build(BuildContext context) {
    var Mediaqueryhight = MediaQuery.of(context).size.height;
    var Mediaquerywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: Container(
          width: Mediaquerywidth,
          height: Mediaqueryhight,
          child: Stack(
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
                              image: NetworkImage(widget.thumnails.toString()),
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
                                widget.namabarang.toString(),
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
                                  return kelengkapanbarang[index];
                                }),
                          ),
                          //keterangan
                          Text(
                            "keterangan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                widget.keterangan.toString(),
                                style: TextStyle(fontFamily: 'EmojiOne'),
                              )),
                          //gambar

                          Container(
                            width: Mediaquerywidth,
                            height: Mediaqueryhight / 7,
                            margin: EdgeInsets.only(top: 15),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: datapoto.length,
                                itemBuilder: (context, index) {
                                  return datapoto[index];
                                }),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Mediaquerywidth,
                  height: 40,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Rp.${widget.harga.toString()}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            style:
                                                TextStyle(color: Colors.green),
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
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, right: 30, left: 30),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "bayar",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
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
