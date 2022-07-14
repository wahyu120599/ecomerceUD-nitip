import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../service/komfirmasibayar/komfirmasi.dart';
import 'form.dart';

class Userkmfir extends StatefulWidget {
  const Userkmfir({Key? key}) : super(key: key);

  @override
  State<Userkmfir> createState() => _UserkmfirState();
}

class _UserkmfirState extends State<Userkmfir> {
  var serveicekomfir = Komfirmasibayar();
  var _nowa = "";
  var _notelp = "";
  var _email = "";
  var _id;
  bool dataisemty = false;
  bool isloading = true;
  _getkom() {
    serveicekomfir.getkomfir().then((value) {
      if (value.message == "get data sucsess") {
        if (value.data!.isNotEmpty) {
          setState(() {
            _id = value.data![0].id!;
            _nowa = value.data![0].no_wa!;
            _notelp = value.data![0].no_telpon!;
            _email = value.data![0].email!;
            dataisemty = true;
          });
        }
        setState(() {
          isloading = false;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getkom();
  }

  @override
  Widget build(BuildContext context) {
    return (isloading == true)
        ? Shimmer.fromColors(
            baseColor: Color.fromARGB(255, 216, 215, 215),
            highlightColor: Color.fromARGB(255, 255, 255, 255),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5)),
              height: MediaQuery.of(context).size.height / 15,
            ))
        : Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(5)),
            child: _card(context, dataisemty),
          );
  }

  Row _card(BuildContext context, isemty) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //data
        Container(
          padding: EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              isemty == true ? "wa:${_nowa}" : "wa belum di isi",
              style: TextStyle(color: Colors.amber),
            ),
            Text(isemty == true ? "email:${_email}" : "email belum di isi",
                style: TextStyle(color: Colors.amber))
          ]),
        ),
        InkWell(
          onTap: () {
            showDialog(
                barrierColor: Color.fromARGB(53, 254, 254, 254),
                context: context,
                builder: (context) {
                  return Material(
                    color: Color.fromARGB(0, 255, 193, 7),
                    child: Formdata(
                        isUpdate: (_nowa == "") ? "ADD" : "UPDATE",
                        id: _id,
                        email: _email,
                        no_wa: _nowa,
                        no_telpon: _notelp),
                  );
                });
          },
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(color: Colors.amber),
            child: Text((_nowa == "") ? "ADD" : "UPDATE"),
          ),
        )
      ],
    );
  }
}
