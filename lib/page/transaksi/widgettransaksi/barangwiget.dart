import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udmurahmotor/core/matrialwiget/materialcolor.dart';

import '../apicontroller/transaksicontroller.dart';

barangwiget(context, name, codebarang, controller) {
  context:
  context;
  var _medwidh = MediaQuery.of(context).size.width;
  var _medhight = MediaQuery.of(context).size.height;
  return showDialog(
      context: context,
      builder: (context) {
        Transaksikontroller transaksi = Get.put(Transaksikontroller());
        return Material(
          color: Color.fromARGB(64, 0, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(
                top: _medhight / 3,
                bottom: _medhight / 2.5,
                right: 80,
                left: 80),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 221, 120),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        name.toString(),
                        style: TextStyle(
                          color: Colordata().texcolors,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: controller,
                      autofocus: true,
                      enabled: true,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (x) {
                        if (x.isNotEmpty) {
                          var titik = x.split(".");
                          var join1 = titik.join("");
                          var koma = join1.split(",");
                          var joind2 = koma.join("");
                          transaksi.addmasal(joind2, codebarang);
                        }
                        // Get.back();
                      },
                      decoration: const InputDecoration(
                          fillColor: Colors.amber,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white38)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: 'Mau beli berapa ? ..',
                          hintStyle: const TextStyle(color: Colors.white38)),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
