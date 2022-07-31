// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../listbarang/listbarang.dart';

class CardCount extends StatelessWidget {
  const CardCount(
      {Key? key, this.JumlahBarang, this.terjual, this.contextwiget})
      : super(key: key);
  final int? JumlahBarang;
  final int? terjual;
  final String? contextwiget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        "Jumlah Barang",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                    Container(
                      child: Text(
                        (contextwiget == "rupiah")
                            ? "Rp.$JumlahBarang"
                            : "$JumlahBarang",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: (contextwiget == "rupiah") ? 25 : 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        "terjual",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                    Container(
                      child: Text(
                        (contextwiget == "rupiah")
                            ? "Rp.$JumlahBarang"
                            : "$JumlahBarang",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: (contextwiget == "rupiah") ? 25 : 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Get.to(ListBarang());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: const [
                      Text(
                        "List Barang",
                        style: TextStyle(color: Colors.amber),
                      ),
                      Icon(
                        Icons.arrow_right_sharp,
                        color: Colors.amber,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
