import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udmurahmotor/core/matrialwiget/materialcolor.dart';

import 'controller/updatebarangcontroller.dart';

class UpdateBarang extends StatefulWidget {
  const UpdateBarang({Key? key, this.id}) : super(key: key);
  final id;
  @override
  State<UpdateBarang> createState() => _UpdateBarangState();
}

class _UpdateBarangState extends State<UpdateBarang> {
  Updatebarang updatebarang = Updatebarang();

  @override
  void initState() {
    // TODO: implement initState
    updatebarang.getdatabarag(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (updatebarang.isloading.isTrue)
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              )
            : SingleChildScrollView(
                child: Container(
                color: Colordata().bodycolors,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 180),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        color: Colors.black,
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            formfield("NAMA BARANG", "tulis disini",
                                updatebarang.namacontroler, updatebarang),
                            const SizedBox(
                              height: 25,
                            ),
                            formfield("HARGA BARANG", "tulis disini",
                                updatebarang.hargacontroler, updatebarang),
                            const SizedBox(
                              height: 25,
                            ),
                            formfield("JUMLAH BARANG", "tulis disini",
                                updatebarang.jumlahcontroler, updatebarang),
                            const SizedBox(
                              height: 50,
                            ),
                            Material(
                              color: Colordata().bodycolors,
                              child: InkWell(
                                splashColor: Colors.white,
                                onTap: () {
                                  updatebarang.updatebarang(
                                      widget.id,
                                      updatebarang.namacontroler.text,
                                      updatebarang.jumlahcontroler.text,
                                      updatebarang.hargacontroler.text);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  child: const Center(
                                    child: Text(
                                      "SIMPAN PERUBAHAN",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              )),
      ),
    );
  }

  Column formfield(String label, String hint, controller, updatebarang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              children: []),
        ),
        TextFormField(
          controller: controller,
          cursorColor: Colors.white,
          enableInteractiveSelection: false,
          style: const TextStyle(color: Colors.white, fontSize: 14.0),
          decoration: InputDecoration(
            isDense: true,
            hoverColor: Colors.white,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white30, fontSize: 14.0),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white),
              // borderSide: BorderSide()
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white54),
            ),
          ),
        )
      ],
    );
  }
}
