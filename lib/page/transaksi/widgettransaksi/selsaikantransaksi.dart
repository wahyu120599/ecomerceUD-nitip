import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apicontroller/transaksicontroller.dart';

selesaikantransaksi(context, controller) {
  Transaksikontroller transaksi = Get.put(Transaksikontroller());
  return showDialog(
      context: context,
      builder: (context) {
        var hight = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        var boder = BorderRadius.circular(5);
        List<int> sourcut = [20, 50, 100, 200, 300, 400, 500];
        return Material(
          color: Color.fromARGB(28, 0, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(
                top: hight / 4, bottom: hight / 3, left: 20, right: 20),
            child: Container(
              height: hight,
              width: width,
              padding: EdgeInsets.all(7),
              decoration:
                  BoxDecoration(color: Colors.amber, borderRadius: boder),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: width,
                      height: hight / 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sourcut.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              transaksi.sourcut(controller, sourcut[index]);
                              // transaksi.kakulasikembalian(
                              //     transaksi.total, int.parse(controller.text));
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white, borderRadius: boder),
                              child:
                                  Center(child: Text("${sourcut[index]} RB")),
                            ),
                          );
                        },
                      )),
                  TextField(
                    onChanged: (v) {
                      print(v);
                      if (v.isNotEmpty) {
                        transaksi.k(int.parse(v));
                        transaksi.kakulasikembalian(
                            transaksi.total, int.parse(v));
                      }
                    },
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefix: Text("Rp:",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        fillColor: Colors.amber,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white38)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: 'Jumlah Uang konsumen ? ..',
                        hintStyle: const TextStyle(color: Colors.white38)),
                  ),
                  Container(
                    child: Text(
                      "sisa uang : Rp.${transaksi.k}",
                      style: TextStyle(fontSize: 25),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
