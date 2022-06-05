import 'package:flutter/material.dart';
import 'package:udmurahmotor/FuctionHelper/flusbar.dart';

import '../../FuctionHelper/shared/shared.dart';
import '../../service/order/add.dart';

class Cardbarang extends StatefulWidget {
  final int? id;
  final String? nama;
  final String? thumnails;
  final String? keterangan;
  final int? harga;

  const Cardbarang({
    this.id,
    this.nama,
    this.thumnails,
    this.keterangan,
    this.harga,
    Key? key,
  }) : super(key: key);

  @override
  State<Cardbarang> createState() => _CardbarangState();
}

class _CardbarangState extends State<Cardbarang> {
  var order = Addbarang();
  var shared = Shared();
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/Details', arguments: {
            "id": widget.id,
            "nama": widget.nama,
            "harga": widget.harga,
            "thumnails": widget.thumnails,
            "keterangan": widget.keterangan
          });
        },
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(5)),
                      image: DecorationImage(
                          image: NetworkImage(widget.thumnails.toString()),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 15, left: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Text(
                              widget.nama.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Text(
                          widget.harga!.toDouble().toString(),
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () async {
                            var userid = await shared.getint("id");
                            order
                                .creteorder(widget.id, userid, 1, "")
                                .then((value) {
                              if (value['mesage'] == "create data sucsess") {
                                flusbartop(context, "di masukan ke keranjang",
                                    Colors.green);
                              } else if (value["mesage"] ==
                                  "oder status create") {
                                flusbartop(
                                    context, "lihat keranjang", Colors.green);
                              } else {
                                flusbartop(context, "gagal", Colors.amber);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5, top: 10),
                            padding: EdgeInsets.only(top: 3, bottom: 3),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "keranjang",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.shopping_cart_outlined),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
