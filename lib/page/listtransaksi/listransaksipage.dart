// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udmurahmotor/page/listtransaksi/transaksicontroller/transaksicontroller.dart';

import '../../core/matrialwiget/materialcolor.dart';

class ListTransaksi extends StatefulWidget {
  const ListTransaksi({Key? key}) : super(key: key);

  @override
  State<ListTransaksi> createState() => _ListTransaksiState();
}

class _ListTransaksiState extends State<ListTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colordata().bodycolors,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(child: const BodyListTransaksi()),
            Container(
              color: Color.fromARGB(115, 0, 0, 0),
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 43),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.amber,
                          ))),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: const EdgeInsets.only(top: 37.0),
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: TextFormField(
                      scrollPadding: const EdgeInsets.all(5),
                      cursorColor: const Color.fromARGB(166, 255, 193, 7),
                      style: const TextStyle(color: Colors.amber),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'nama barang . . .',
                        prefix: const Text("search: "),
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(57, 255, 193, 7)),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(166, 255, 193, 7),
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(53),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(166, 255, 193, 7),
                              width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(53),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(166, 255, 193, 7),
                              width: 2.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyListTransaksi extends StatelessWidget {
  const BodyListTransaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransaksiController transaksiController = Get.put(TransaksiController());
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      transaksiController.getlist(100, 0);
    });
    // getlisapibarang.getlisbarang();
    return Obx(
      () => (transaksiController.isLoading.isTrue)
          ? Center(
              // ignore: prefer_const_constructors
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 110),
              itemCount: transaksiController.listransaksiModel.data?.length,
              // itemCount: 10,
              itemBuilder: (context, index) {
                var data = transaksiController.listransaksiModel.data?[index];
                return Card(
                  color: Colors.black,
                  child: Container(
                    child: ListTile(
                      onTap: () {},
                      trailing: Text(
                        "jumlah : ",
                        style: TextStyle(color: Colordata().iconcolors),
                      ),
                      leading: Image.network("${data?.barang?.poto}"),
                      title: Text(
                        "sas",
                        style: TextStyle(color: Colordata().texcolors),
                      ),
                      subtitle: Text("dsd",
                          style: TextStyle(color: Colordata().texcolors)),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
