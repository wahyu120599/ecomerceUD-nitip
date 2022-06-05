import 'package:flutter/material.dart';

import '../../FuctionHelper/appbar.dart';
import '../../FuctionHelper/costumlisitem.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    var Mediaquerywidth = MediaQuery.of(context).size.width;
    var Mediaqueryhight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: appbar(context, Mediaquerywidth, Mediaqueryhight, false),
        body: Container(
          margin: EdgeInsets.only(left: 11, right: 10),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/Details");
                  },
                  child: Card(
                    child: CustomListItem(
                      id: 1,
                      harga: 'Rp.2000000',
                      viewCount: "belum di bayar",
                      thumbnail: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            color: Colors.yellow,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfybR-hj66ThrTdnojUuZLwa8JnheUClyl8g&usqp=CAU"),
                                fit: BoxFit.cover)),
                      ),
                      title: 'Announcing Flutter 1.0',
                    ),
                  ),
                );
              }),
        ));
  }
}
