// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/matrialwiget/materialcolor.dart';
import '../detailbarang/detailbarang.dart';
import 'apicontroller/getapicontroller.dart';

class ListBarang extends StatefulWidget {
  const ListBarang({Key? key}) : super(key: key);

  @override
  State<ListBarang> createState() => _ListBarangState();
}

class _ListBarangState extends State<ListBarang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colordata().bodycolors,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
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
            Container(
                margin: const EdgeInsets.only(top: 70), child: const Bodylist())
          ],
        ),
      ),
    );
  }
}

class Bodylist extends StatelessWidget {
  const Bodylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Getlisapibarang getlisapibarang = Get.put(Getlisapibarang());
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
    // getlisapibarang.getlisbarang();
    return Obx(
      () => (getlisapibarang.isLoading.isTrue)
          ? Center(
              // ignore: prefer_const_constructors
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: getlisapibarang.v.data?.length,
              itemBuilder: (context, index) {
                final data = getlisapibarang.v.data![index];
                return Card(
                  color: Colors.black,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ListTile(
                      onTap: () {
                        Get.to(Detaiil(
                          id: data.id,
                        ));
                      },
                      trailing: Text(
                        "jumlah : ${data.jumlah}",
                        style: TextStyle(color: Colordata().iconcolors),
                      ),
                      leading: Image.network(data.poto.toString()),
                      title: Text(
                        data.name.toString(),
                        style: TextStyle(color: Colordata().texcolors),
                      ),
                      subtitle: Text("Rp.${data.harga}",
                          style: TextStyle(color: Colordata().texcolors)),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
