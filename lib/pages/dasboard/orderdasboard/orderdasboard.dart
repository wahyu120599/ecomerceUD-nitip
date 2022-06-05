import 'package:flutter/material.dart';

import '../../../model/getorderbystatus_and _userid.dart';
import '../../../service/order/getorder.dart';
import '../appbar.dart';
import '../sidebar.dart';

class Orderdatboard extends StatefulWidget {
  const Orderdatboard({Key? key}) : super(key: key);

  @override
  State<Orderdatboard> createState() => _OrderdatboardState();
}

class _OrderdatboardState extends State<Orderdatboard> {
  final textformfieldrool = TextEditingController();
  final order = Getorder();
  @override
  Widget build(BuildContext context) {
    var Mediawidth = MediaQuery.of(context).size.width;
    var Mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Sidebar(),
      appBar: dsboardappbar(context),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // search
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text("Cari order"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Mediawidth / 1.5,
                  height: Mediaheight / 15,
                  child: TextFormField(
                    controller: textformfieldrool,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "orderID . . .",
                        labelText: "Cari orders",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // if (textformfieldrool.text.isNotEmpty) {
                    //   show(context);
                    //   var createroll = kategoriservice
                    //       .postkategori(textformfieldrool.text)
                    //       .then((value) {
                    //     if (value["mesage"] == "create data sucsess") {
                    //       print(value);

                    //       Navigator.pushReplacementNamed(
                    //           context, '/Kategoribarang');
                    //       successcreated(context);
                    //     } else {
                    //       postfaild(context);
                    //     }
                    //   });
                    // } else {
                    //   emtyform(context);
                    // }
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    margin: EdgeInsets.only(left: 5),
                    height: Mediaheight / 15,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "create",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),

            Container(
              height: 200,
              width: Mediaheight,
              child: FutureBuilder<List<Dataorder>>(
                future: order.getorder(2),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final d = snapshot.data?[index];
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      content: Container(
                                        width: Mediawidth,
                                        height: Mediaheight / 4,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text("namabarang:"),
                                                Text(d!.barang!.namabarang!
                                                    .toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("codeorder:"),
                                                Text(d.ordercode.toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("no-plat:"),
                                                Text(d.barang!.no_plat!
                                                    .toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("harga:"),
                                                Text(d.barang!.harga.toString())
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("tgl_order:"),
                                                Text(d.orderdate.toString())
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.black))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: Mediawidth / 8,
                                  height: Mediawidth / 7,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(d!
                                              .barang!.thumnails
                                              .toString()))),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: Text(d.barang!.namabarang!.toString()),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: Mediawidth / 7,
                                    // height: Mediaheight / 9,
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Center(
                                      child: Text(
                                        "Setujui",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
