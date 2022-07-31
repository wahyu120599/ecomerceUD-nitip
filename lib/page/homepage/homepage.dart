// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../postbarang/postbarang.dart';
import '../transaksi/transaksi.dart';
import 'controller/homecontroller.dart';
import 'widged/cardbarang.dart';
import 'widged/cardcount.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Homecontroller homecontroller = Get.put(Homecontroller());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 34, 34, 34),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.amber,
          backgroundColor: Colors.black,
          onPressed: () {
            Get.to(() => Transaksi());
          },
          child: Icon(Icons.qr_code_scanner_outlined),
        ),
        body: Container(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color.fromARGB(255, 34, 34, 34),
            padding: EdgeInsets.only(left: 15, right: 15),
            child: ListView(
              children: [
                Text(
                  "Barang dagangan",
                  style: TextStyle(color: Colors.amber),
                ),
                SizedBox(
                  height: 5,
                ),
                (homecontroller.loadingerjual.isTrue ||
                        homecontroller.loadingbarang.isTrue)
                    ? loadingwiget(context)
                    : CardCount(
                        JumlahBarang: homecontroller.countBarang.jumlahbarang,
                        terjual: homecontroller.countTerjual.jumlahTerjual),
                SizedBox(height: MediaQuery.of(context).size.width / 11),
                Text(
                  "Barang dagangan dalam rupiah",
                  style: TextStyle(color: Colors.amber),
                ),
                SizedBox(
                  height: 5,
                ),
                (homecontroller.loadingerjual.isTrue ||
                        homecontroller.loadingbarang.isTrue)
                    ? loadingwiget(context)
                    : CardCount(
                        contextwiget: "rupiah",
                        terjual: homecontroller.countTerjual.totalrupiahterjual,
                        JumlahBarang: homecontroller.countBarang.dalamrupiah),
                SizedBox(height: MediaQuery.of(context).size.width / 8),
                Cardbarang()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container loadingwiget(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height / 15,
      color: Color.fromARGB(255, 82, 82, 82),
    );
  }
}
