import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udmurahmotor/pages/Profile/bayar.dart';

import 'suksbayarmitrans.dart';

class Disetujui extends StatelessWidget {
  var data;
  Disetujui({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2.3,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(data.barang!.thumnails),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.only(left: 2),
            // color: Colors.blue,
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.only(bottom: 10, top: 3, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.barang!.namabarang,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "oderan anda disetujui segera lakukan pembayaran",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "Rp.${data.barang.harga}",
                  style: TextStyle(fontSize: 20, color: Colors.amber),
                  textAlign: TextAlign.start,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            top: 7, bottom: 7, right: 10, left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)
                            // color: Colors.amber,
                            ),
                        child: Text(
                          "batalkan",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )),
                    InkWell(
                      onTap: () {
                        Get.to(Bayar(data: data),
                            transition: Transition.noTransition);
                        // Get.to(Suksesbayarwidhmitrans());
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              top: 7, bottom: 7, right: 10, left: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)
                              // color: Colors.amber,
                              ),
                          child: Text(
                            "bayar sekarang",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
