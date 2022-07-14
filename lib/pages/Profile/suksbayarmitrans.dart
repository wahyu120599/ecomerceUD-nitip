import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class Suksesbayarwidhmitrans extends StatefulWidget {
  final vanumber, bank, tagihan;
  const Suksesbayarwidhmitrans(
      {Key? key, this.bank, this.tagihan, this.vanumber})
      : super(key: key);

  @override
  State<Suksesbayarwidhmitrans> createState() => _SuksesbayarwidhmitransState();
}

class _SuksesbayarwidhmitransState extends State<Suksesbayarwidhmitrans> {
  ScreenshotController screenshotController = ScreenshotController();
  // bool permissionGranted;
  Future _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        // permissionGranted = true;
        print("permision is grated");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screenshot(
        controller: screenshotController,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 10, right: 10, top: 70, bottom: 30),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              ),
              Text(
                "SUCCESS",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: const Text(
                  "Catat Nomer virtual account dan jumlah tagihan atau prin sebelum kelua dari halaman ini",
                  style: TextStyle(color: Colors.amber),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _cardprint(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/Mainpage");
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.green,
                              ),
                              Text(
                                "Kembal",
                                style: TextStyle(color: Colors.green),
                              )
                            ],
                          ),
                        ),
                      )),
                  Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      child: InkWell(
                        onTap: () async {
                          await _getStoragePermission();
                          screenshotController
                              .captureFromWidget(
                                  InheritedTheme.captureAll(
                                      context, Material(child: _cardprint())),
                                  delay: Duration(seconds: 1))
                              .then((capturedImage) {
                            // ShowCapturedWidget(context, capturedImage);
                            _saved(capturedImage);
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.save,
                                color: Colors.green,
                              ),
                              Text(
                                "print save",
                                style: const TextStyle(color: Colors.green),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(
            child: capturedImage != null
                ? Image.memory(capturedImage)
                : Container()),
      ),
    );
  }

  _cardprint() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      height: MediaQuery.of(context).size.height / 1.9,
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Column(children: [
        Text("UD Murah Motor"),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bank:"),
              Text("${widget.bank}"),
              SizedBox(
                height: 4,
              ),
              Text("Virual Account:"),
              Text("${widget.vanumber}"),
              SizedBox(
                height: 4,
              ),
              Text("Total Tagihan:"),
              Text("Rp.${widget.tagihan}"),
            ],
          ),
        )
      ]),
    );
  }

  _saved(image) async {
    final imagedata = Uint8List.fromList(image);
    final result = await ImageGallerySaver.saveImage(imagedata,
        quality: 80, name: "uhuii");
    print("File Saved to Gallery");
  }
}
