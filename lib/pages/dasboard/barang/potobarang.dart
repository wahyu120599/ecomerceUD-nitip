// potobarang
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udmurahmotor/FuctionHelper/flusbar.dart';

import '../../../service/potobarang/deletepoto.dart';
import '../../../service/potobarang/postpotobarang.dart';
import 'detailbarang.dart';

class Createpoto extends StatefulWidget {
  final id;
  final nama;
  final harga;
  final thumnails;
  const Createpoto({Key? key, this.id, this.harga, this.nama, this.thumnails})
      : super(key: key);

  @override
  State<Createpoto> createState() => _CreatepotoState();
}

class _CreatepotoState extends State<Createpoto> {
  var postpotobarang = Postpotobarangs();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final ImagePicker _picker = ImagePicker();
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          postpotobarang.postdatapotobarang(image, widget.id).then((value) {
            if (value['mesage'] == "create data sucsess") {
              successcreated(context);
            }
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 7,
        // color: Colors.amber,
        // width: 100,
        // height: 100,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Stack(children: [
          Center(
            child: Icon(
              Icons.image_outlined,
              size: 70,
            ),
          ),
          Center(
              child: Text(
            "+",
            style: TextStyle(fontSize: 30),
          ))
        ]),
      ),
    );
  }
}

class Viewimage extends StatefulWidget {
  const Viewimage({Key? key, this.image, this.id}) : super(key: key);
  final image;
  final id;
  @override
  State<Viewimage> createState() => _ViewimageState();
}

class _ViewimageState extends State<Viewimage> {
  var postpotobarang = Postpotobarangs();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.image)))),
                      Container(
                        // padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(45)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  deletepotobarang(widget.id).then((value) {
                                    if (value["mesage"] == "delete success") {
                                      Navigator.pop(context);
                                      succesdeleted(context);
                                    }
                                  });
                                },
                                icon: Icon(Icons.delete_outline)),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 7,
        // color: Color.fromARGB(255, 3, 121, 111),
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.image), fit: BoxFit.cover)),
      ),
    );
  }
}
