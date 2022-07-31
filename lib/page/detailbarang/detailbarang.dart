// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udmurahmotor/core/matrialwiget/materialcolor.dart';

import '../updatebarang/updatebarang.dart';
import 'controller/controller.dart';

class Detaiil extends StatefulWidget {
  const Detaiil({Key? key, this.id}) : super(key: key);
  final int? id;
  @override
  State<Detaiil> createState() => _DetaiilState();
}

class _DetaiilState extends State<Detaiil> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Detailcontroller detailscontroller = Get.put(Detailcontroller());
    detailscontroller.getdatabarag(widget.id);

    return Scaffold(
      body: Obx(
        () => (detailscontroller.isloading.isTrue)
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colordata().bodycolors,
                child: Column(children: [
                  //head
                  Container(
                    color: Colordata().cardcolors,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 5,
                            margin: EdgeInsets.only(top: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: NetworkImage(detailscontroller
                                        .getbarangdetailModel.poto
                                        .toString()),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Edit",
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Get.to(UpdateBarang(
                                      id: widget.id,
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.create,
                                    color: Colors.amber,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  //endhead
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(7),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: width,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black))),
                            child: Text(
                              detailscontroller.getbarangdetailModel.name
                                  .toString(),
                              style: TextStyle(
                                  color: Colordata().texcolors, fontSize: 30),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text(
                              "Harga Barang",
                              style: TextStyle(
                                  color: Colordata().texcolors, fontSize: 15),
                            )),
                        Container(
                            width: width,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black))),
                            child: Text(
                              "Rp.${detailscontroller.getbarangdetailModel.harga}",
                              style: TextStyle(
                                  color: Colordata().iconcolors, fontSize: 30),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text(
                              "jumlah barang",
                              style: TextStyle(
                                  color: Colordata().texcolors, fontSize: 15),
                            )),
                        Container(
                            child: Text(
                          "${detailscontroller.getbarangdetailModel.jumlah}",
                          style: TextStyle(
                              color: Colordata().texcolors, fontSize: 30),
                        )),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 20),
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jumlah Terjual",
                                style: TextStyle(
                                    color: Colordata().texcolors, fontSize: 30),
                              ),
                              Text(
                                "${detailscontroller.detailbarangTerjuaModel.data?.length}",
                                style: TextStyle(
                                    color: Colordata().iconcolors,
                                    fontSize: 30),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Setara Rp.${detailscontroller.terjualdalamrupiah}",
                                style: TextStyle(
                                    color: Colordata().iconcolors,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
      ),
    );
  }
}
