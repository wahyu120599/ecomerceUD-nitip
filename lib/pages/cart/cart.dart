import 'package:flutter/material.dart';
import 'package:udmurahmotor/FuctionHelper/appbar.dart';
import 'package:udmurahmotor/FuctionHelper/costumlisitem.dart';

import '../../model/getorderbystatus_and _userid.dart';
import '../../service/order/getorder.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var getorder = Getorder();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var Mediaquerywidth = MediaQuery.of(context).size.width;
    var Mediaqueryhight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appbar(context, Mediaquerywidth, Mediaqueryhight, true),
      body: Container(
        margin: EdgeInsets.only(left: 11, right: 10),
        child: FutureBuilder<List<Dataorder>>(
          future: getorder.getorder(1),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data?[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/Details', arguments: {
                          "id": data!.barang!.id,
                          "nama": data.barang!.namabarang,
                          "harga": data.barang!.harga,
                          "thumnails": data.barang!.thumnails,
                          "keterangan": data.barang!.keterangan
                        });
                      },
                      child: Card(
                        child: CustomListItem(
                          id: data!.id!.toInt(),
                          harga: "Rp.${data.barang!.harga.toString()}",
                          viewCount: "",
                          thumbnail: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        data.barang!.thumnails.toString()))),
                          ),
                          title: data.barang!.namabarang.toString(),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
