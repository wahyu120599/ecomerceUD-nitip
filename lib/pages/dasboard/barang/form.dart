import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:image_picker/image_picker.dart';

import '../../../FuctionHelper/flusbar.dart';
import '../../../model/getkategoribarang.dart';
import '../../../service/getdatakategoribarang.dart';
import '../../../service/barang/postbarang.dart';

class Forminputbarang extends StatefulWidget {
  const Forminputbarang({Key? key}) : super(key: key);

  @override
  State<Forminputbarang> createState() => _ForminputbarangState();
}

class _ForminputbarangState extends State<Forminputbarang> {
  var getdatakatbarang = Getdatakatebarang();
  var postbarang = Postbarangs();
  final namabarangformfield = TextEditingController();
  final hargaformfield = TextEditingController();
  final no_platformfield = TextEditingController();
  final keteranganformfield = TextEditingController();
  final kategoribarangformfield = TextEditingController();
  bool isloading = false;
  var thumnails;

  String? selectedValue;
  List<Datakategori> items = [];

  getdbarang() {
    getdatakatbarang.getkatebarang().then((value) {
      print(value);
      if (value.isNotEmpty) {
        value.forEach((v) {
          // print(v.namakategori);
          setState(() {
            items.add(v);
          });
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdbarang();
  }

  @override
  Widget build(BuildContext context) {
    var Mediaqueriwidth = MediaQuery.of(context).size.width;
    var Mediaqueriheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: Mediaqueriwidth,
            height: Mediaqueriheight,
            padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
            child: ListView(
              padding: EdgeInsets.only(top: Mediaqueriheight / 10),
              children: [
                InkWell(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      thumnails = image;
                    });
                  },
                  child: (thumnails != null)
                      ? Container(
                          height: Mediaqueriheight / 4,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(File(thumnails.path)),
                                  fit: BoxFit.contain)),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: Mediaqueriheight / 4,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Stack(children: [
                            Center(
                                child: Icon(
                              Icons.image,
                              size: 80,
                              color: Colors.black38,
                            )),
                            Center(
                              child: Text(
                                "thumnails",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ]),
                        ),
                ),
                kategori(Mediaqueriheight),
                Formfield("nama barang. . ", namabarangformfield, "tx"),
                Formfield("harga. . .", hargaformfield, "nb"),
                Formfield("no_plat. . .", no_platformfield, "tx"),
                Formfieldarea("keterangan. . .", keteranganformfield, "tx"),
                InkWell(
                    onTap: () {
                      if (namabarangformfield.text.isNotEmpty &&
                          hargaformfield.text.isNotEmpty &&
                          no_platformfield.text.isNotEmpty &&
                          keteranganformfield.text.isNotEmpty &&
                          thumnails != null &&
                          selectedValue != null) {
                        setState(() {
                          isloading = true;
                        });
                        postbarang
                            .postdatabarang(
                                namabarangformfield.text,
                                hargaformfield.text,
                                no_platformfield.text,
                                keteranganformfield.text,
                                thumnails.path,
                                selectedValue)
                            .then((value) {
                          if (value["mesage"] == "create data sucsess") {
                            setState(() {
                              isloading = false;
                            });
                          }
                        });
                      } else {
                        emtyform(context);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "upload",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          isloading
              ? GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: Mediaqueriwidth,
                    height: Mediaqueriheight,
                    color: Colors.black38,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Container kategori(double Mediaqueriheight) {
    return (items.isEmpty)
        ? Container()
        : Container(
            // padding: EdgeInsets.all(0),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(5)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: const [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Pilih jenis barang',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item.id.toString(),
                          child: Text(
                            item.namakategori.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                    print(selectedValue);
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: 14,
                iconEnabledColor: Colors.black,
                iconDisabledColor: Colors.grey,
                buttonHeight: Mediaqueriheight / 15,
                buttonWidth: 160,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  // color: Colors.redAccent,
                ),
                // buttonElevation: 2,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: Mediaqueriheight / 4.5,
                // dropdownWidth: 250,
                // dropdownPadding: EdgeInsets.all(5),
                dropdownDecoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.redAccent,
                ),
                dropdownElevation: 0,
                scrollbarRadius: const Radius.circular(2),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                // offset: const Offset(-10, 0),
              ),
            ),
          );
  }

  Container Formfield(hintlable, controler, type) {
    return Container(
      height: MediaQuery.of(context).size.height / 15,
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType:
            (type == "nb") ? TextInputType.number : TextInputType.text,
        controller: controler,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: hintlable,
            labelText: hintlable,
            labelStyle: TextStyle(color: Colors.black)),
      ),
    );
  }

  Container Formfieldarea(hintlable, controler, type) {
    return Container(
      // height: MediaQuery.of(context).size.height / 15,
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        controller: controler,
        maxLines: null,
        minLines: 1,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: hintlable,
            labelText: hintlable,
            labelStyle: TextStyle(color: Colors.black)),
      ),
    );
  }
}
