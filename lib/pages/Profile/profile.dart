import 'package:flutter/material.dart';
import 'package:udmurahmotor/model/getorderbystatus_and%20_userid.dart';
import 'package:udmurahmotor/pages/Profile/wigetfuction.dart';

import '../../service/order/getorder.dart';
import 'cardlist.dart';
import 'urllauch.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var getorder = Getorder();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzsC7zjlIbyL9TIXLO-VSnG7V1Zrleuy7iJA&usqp=CAU",
                          ),
                          radius: 40,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                                backgroundColor: Color.fromARGB(0, 255, 193, 7),
                                radius: 15,
                                child: IconButton(
                                    color: Colors.white,
                                    iconSize: 30,
                                    onPressed: () {
                                      print("object");
                                    },
                                    icon: Icon(
                                      Icons.camera,
                                    ))),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          margin: EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // margin: EdgeInsets.only(right: 1),
                                width: MediaQuery.of(context).size.width / 1.3,
                                child: Text(
                                  "Dolnalt Tamboy sasasa dsdsd",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "member",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  dasboard(),
                                  logout(),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 5,
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 3,
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Colors.amber,
                            tabs: [
                              Tab(
                                text: "orderan saya",
                              ),
                              Tab(
                                text: "Disetujui",
                              ),
                              Tab(
                                text: "konfirmasi",
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.7,
                          child: TabBarView(children: <Widget>[
                            Container(
                                child: FutureBuilder<List<Dataorder>>(
                              future: getorder.getorder(2),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (context, index) {
                                      final d = snapshot.data?[index];
                                      return cardlist(
                                        barangname:
                                            d!.barang!.namabarang.toString(),
                                        text: Text("menuggu persetujuan"),
                                        harga: d.barang!.harga!.toInt(),
                                        from: "order",
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
                            )),
                            Container(
                                // height: MediaQuery.of(context).size.height / 1.4,
                                // color: Colors.amber,
                                child: FutureBuilder<List<Dataorder>>(
                              future: getorder.getorder(2),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    // scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data?.length,
                                    itemBuilder: (context, index) {
                                      final d = snapshot.data?[index];
                                      return cardlist(
                                        barangname:
                                            d!.barang!.namabarang.toString(),
                                        text: Text(
                                            "orderan anda disetujui segera lakukan pembayaran"),
                                        harga: d.barang!.harga!.toInt(),
                                        from: "disetujui",
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
                            )),
                            Container(
                                child: Center(
                              child: Text('Display Tab 1',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ))
                          ]),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
