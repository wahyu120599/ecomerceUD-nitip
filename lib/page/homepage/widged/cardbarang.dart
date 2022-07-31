import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udmurahmotor/page/listtransaksi/listransaksipage.dart';

import '../../postbarang/postbarang.dart';

class Cardbarang extends StatelessWidget {
  const Cardbarang({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(Postdatabarang());
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2.3,
              height: MediaQuery.of(context).size.height / 7,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    // color: Colors.blue,
                    width: MediaQuery.of(context).size.width / 5.8,
                    child: Text(
                      "barang Masuk",
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.plus_one,
                      color: Colors.amber,
                      size: 90,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => ListTransaksi());
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2.3,
              height: MediaQuery.of(context).size.height / 7,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
              child: Stack(
                // crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    // color: Colors.blue,
                    width: MediaQuery.of(context).size.width / 5.8,
                    child: const Text(
                      "List Transaksi",
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.list,
                      color: Colors.amber,
                      size: 90,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
