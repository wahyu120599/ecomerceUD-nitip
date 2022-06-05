import 'package:flutter/material.dart';
import 'package:udmurahmotor/pages/Profile/urllauch.dart';

class cardlist extends StatelessWidget {
  final String barangname;
  final int harga;
  final Widget text;
  final String from;

  const cardlist({
    required this.barangname,
    required this.harga,
    required this.text,
    required this.from,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      // height:
      //     MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width,
      // color: Colors.blue,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 2.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTROu-8yp9z8EsX85QV-n3DObApbbZOlyD4gg&usqp=CAU"),
                    fit: BoxFit.cover)),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(bottom: 3),
              width: MediaQuery.of(context).size.width / 2.1,
              child: Text(
                barangname,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.1,
              child: Text(
                "Rp.20000000",
                style: TextStyle(color: Colors.amber),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width / 2.1,
                child: text),
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (contex) {
                        return AlertDialog(
                          content: Container(
                            child: Column(
                              children: [
                                Text(
                                    "anda bisa melakukan pembayaran dengan mendatangin sorum kami atau transfer bank ke: xxxxxx, setelah itu kirim bukti pembayaran melaui pilihan berikut"),
                                Row(
                                  children: [
                                    Urllauch(
                                      title: "Watshapp",
                                      icon: Image(
                                          image:
                                              AssetImage("assets/watshap.png")),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: (from == "order")
                    ? Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.only(
                            top: 3, bottom: 3, left: 5, right: 5),
                        child: Text("Batalkan"),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5)),
                      )
                    : (from == "disetujui")
                        ? Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(
                                    top: 3, bottom: 3, left: 5, right: 5),
                                child: Text("Bayar sekarang"),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(
                                    top: 3, bottom: 3, left: 5, right: 5),
                                child: Text("Batalkan"),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5)),
                              )
                            ],
                          )
                        : Container())
          ])
        ],
      ),
    );
  }
}
