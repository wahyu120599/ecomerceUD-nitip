import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udmurahmotor/core/matrialwiget/materialcolor.dart';
import 'package:udmurahmotor/page/postbarang/postbarang.dart';

import 'apicontroller/postdatacontroller.dart';

class Formpostbarang extends StatefulWidget {
  const Formpostbarang({Key? key, required this.codebarang}) : super(key: key);
  final String? codebarang;
  @override
  State<Formpostbarang> createState() => _FormpostbarangState();
}

class _FormpostbarangState extends State<Formpostbarang> {
  final namacontroler = TextEditingController();
  final julmlahcontroler = TextEditingController();
  final hargacontroler = TextEditingController();
  PostdatabarangController postdatabarangController =
      Get.put(PostdatabarangController());
  String? filepath;
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var imagedata = postdatabarangController.image;
    return Form(
      key: _form,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.codebarang.toString()),
        ),
        body: Obx(
          () => (postdatabarangController.isLoading.isTrue)
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.amber),
                )
              : GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                    color: Colordata().bodycolors,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.all(7),
                          child: ListView(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 7,
                                height: MediaQuery.of(context).size.height / 5,
                                margin: const EdgeInsets.only(
                                  left: 100,
                                  right: 100,
                                  top: 20,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    _imageInput();
                                  },
                                  child: (postdatabarangController
                                          .isfile.isTrue)
                                      ? Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3.2,
                                          // child: Image.file(filepath),
                                          decoration: BoxDecoration(
                                              // color: Colors.amber,
                                              image: DecorationImage(
                                                  image: FileImage(File(
                                                      postdatabarangController
                                                          .filedata!.path)))))
                                      : Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3.2,
                                          decoration: const BoxDecoration(
                                              color: Colors.amber,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_X8PcVDjTgU4bNktNdl2cAheMTZOY6CvFkw&usqp=CAU"),
                                                  fit: BoxFit.cover)),
                                        ),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 100),
                                  child: Column(
                                    children: [
                                      input("Nama Barang", namacontroler),
                                      input("Harga Barang", hargacontroler),
                                      input("Jumlah Barang", julmlahcontroler),
                                    ],
                                  )),
                              GestureDetector(
                                onTap: () {
                                  if (postdatabarangController.filedata !=
                                      null) {
                                    final isValid =
                                        _form.currentState!.validate();
                                    if (isValid) {
                                      postdatabarangController
                                          .postdatabarang(
                                              namacontroler.text,
                                              julmlahcontroler.text,
                                              hargacontroler.text,
                                              postdatabarangController
                                                  .filedata!.path,
                                              widget.codebarang)
                                          .then((value) => print(value));
                                    }
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Center(
                                    child: Text("SIMPAN"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  _imageInput() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colordata().cardcolors,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 9,
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    await postdatabarangController
                        .pikfile("camera")
                        .then((value) {
                      Get.back(canPop: true);
                    });
                  },
                  child: Column(children: [
                    Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colordata().iconcolors,
                    ),
                    Text(
                      "Kamera",
                      style: TextStyle(color: Colordata().texcolors),
                    )
                  ]),
                ),
                InkWell(
                  onTap: () async {
                    await postdatabarangController
                        .pikfile("galeri")
                        .then((value) {
                      Get.back();
                    });
                  },
                  child: Column(children: [
                    Icon(
                      Icons.image,
                      size: 50,
                      color: Colordata().iconcolors,
                    ),
                    Text(
                      "Galery",
                      style: TextStyle(color: Colordata().texcolors),
                    )
                  ]),
                )
              ],
            ),
          );
        });
  }

  Container input(label, controler) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Text("Nama BARANG"),
          TextFormField(
            controller: controler,
            validator: (value) {
              if (value!.isEmpty) {
                return "wajib di isi";
              } else {
                return null;
              }
            },
            keyboardType: (label == "Nama Barang")
                ? TextInputType.text
                : TextInputType.number,
            decoration: InputDecoration(
                fillColor: Colors.amber,
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white38)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: '$label ..',
                hintStyle: const TextStyle(color: Colors.white38)),
          ),
        ],
      ),
    );
  }
}
