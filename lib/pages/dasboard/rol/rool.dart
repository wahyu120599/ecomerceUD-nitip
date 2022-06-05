import 'package:flutter/material.dart';
import 'package:udmurahmotor/pages/dasboard/sidebar.dart';

import '../../../FuctionHelper/progres.dart';
import '../../../model/getrool.dart';
import '../../../service/roluser.dart';
import '../appbar.dart';

class Rool extends StatefulWidget {
  const Rool({Key? key}) : super(key: key);

  @override
  State<Rool> createState() => _RoolState();
}

class _RoolState extends State<Rool> {
  var rool = Roolservice();
  final textformfieldrool = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var Mediawidth = MediaQuery.of(context).size.width;
    var Mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Sidebar(),
      appBar: dsboardappbar(context),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text("Buat Rool"),
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
                            hintText: "Username . . .",
                            labelText: "Username",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (textformfieldrool.text.isNotEmpty) {
                          show(context);
                          var createroll = rool
                              .createrool(textformfieldrool.text)
                              .then((value) {
                            if (value.mesage == "create data sucsess") {
                              print(value.mesage);
                              Navigator.pushReplacementNamed(context, "/Rool");
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('sukses'),
                              ));
                            } else {
                              print(value.mesage);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('gagal cobalagi'),
                              ));
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('form tidak boleh kosong'),
                          ));
                        }
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
                  width: Mediawidth,
                  height: Mediaheight / 1.4,
                  margin: EdgeInsets.only(top: 10),
                  child: FutureBuilder<List<Datarool>>(
                    future: rool.getrool(),
                    builder: (context, snapshot) {
                      return (snapshot.hasData)
                          ? ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                var data = snapshot.data![index];
                                return Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.black))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: Mediawidth / 2,
                                          child: Text(data.rolname.toString())),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.update)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete))
                                    ],
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
