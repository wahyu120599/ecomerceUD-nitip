//kelengkapan barang
import 'package:flutter/material.dart';

import '../../../FuctionHelper/flusbar.dart';
import '../../../service/kelengkapan.dart';

class Kelengkapanvew extends StatefulWidget {
  final document;
  final id;
  const Kelengkapanvew({Key? key, this.document, this.id}) : super(key: key);
  @override
  State<Kelengkapanvew> createState() => _KelengkapanvewState();
}

class _KelengkapanvewState extends State<Kelengkapanvew> {
  var kelengkapanserv = Kelengkapanservice();
  final documentfieldcntrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("kelengkapan"),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          size: 20,
                        ))
                  ],
                ),
                content: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: [
                      TextField(
                        controller: documentfieldcntrller,
                        textInputAction: TextInputAction.go,
                        decoration:
                            InputDecoration(hintText: "exaple bppkb,stnk,dll"),
                      ),
                      InkWell(
                        onTap: () {
                          if (documentfieldcntrller.text.isNotEmpty) {
                            kelengkapanserv
                                .postkelengkapan(
                                    documentfieldcntrller.text, widget.id)
                                .then((value) {
                              Navigator.pop(context);
                              successcreated(context);
                            });
                          } else {
                            emtyform(context);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 30, right: 30),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "tambahkan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            border: Border.all(),
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            "+",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class Viewkwlengkapan extends StatefulWidget {
  const Viewkwlengkapan({Key? key, this.dokument, this.id}) : super(key: key);
  final dokument;
  final id;
  @override
  State<Viewkwlengkapan> createState() => _ViewkwlengkapanState();
}

class _ViewkwlengkapanState extends State<Viewkwlengkapan> {
  final fieldkelengkapan = TextEditingController();
  var kelengkapanserv = Kelengkapanservice();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fieldkelengkapan.text = widget.dokument;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => Container(
                  child: AlertDialog(
                      title: Container(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close)),
                      ),
                      content: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          content: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                8,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextField(
                                                  controller: fieldkelengkapan,
                                                  decoration: InputDecoration(
                                                    hintText: "",
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 27),
                                                          child:
                                                              Text("kembali")),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        if (fieldkelengkapan
                                                            .text.isNotEmpty) {
                                                          kelengkapanserv
                                                              .updatekelengkapan(
                                                                  fieldkelengkapan
                                                                      .text,
                                                                  widget.id)
                                                              .then((value) {
                                                            if (value[
                                                                    "mesage"] ==
                                                                "update data sucsess") {
                                                              Navigator.pop(
                                                                context,
                                                              );
                                                              successupdaed(
                                                                  context);
                                                            }
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 27),
                                                          child:
                                                              Text("simpan")),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                              },
                              child: Container(
                                child: Icon(
                                  Icons.create,
                                  size: 30,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                kelengkapanserv
                                    .deletekelengkapan(widget.id)
                                    .then((value) {
                                  if (value["mesage"] ==
                                      "delete data sucsess") {
                                    Navigator.pop(context);
                                    succesdeleted(context);
                                  } else {
                                    print(value);
                                    deletefaild(context);
                                  }
                                });
                              },
                              child: Container(
                                child: Icon(Icons.delete, size: 30),
                              ),
                            )
                          ],
                        ),
                      )),
                ));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            border: Border.all(),
            color: Colors.black,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            widget.dokument,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
