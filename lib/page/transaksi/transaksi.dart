import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:udmurahmotor/core/matrialwiget/materialcolor.dart';
import 'dart:developer';
import 'dart:async';

import 'apicontroller/transaksicontroller.dart';
import 'widgettransaksi/barangwiget.dart';
import 'widgettransaksi/pagebayar.dart';
import 'widgettransaksi/selsaikantransaksi.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({Key? key}) : super(key: key);

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKeytransaksi = GlobalKey(debugLabel: 'QR');
  final jumlahconroller = TextEditingController(text: "1");
  final selsaikanconroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Transaksikontroller transaksi = Get.put(Transaksikontroller());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => (transaksi.isLoading.isTrue)
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.amber,
              ))
            : Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Flexible(flex: 20, child: _buildQrView(context)),
                        Flexible(
                            flex: 10,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              color: Colordata().cardcolors,
                              child: Column(
                                children: [
                                  //=====1====
                                  Container(
                                    color: Colors.black,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          color: Colors.black,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Total Bayar",
                                                style: TextStyle(
                                                    color:
                                                        Colordata().texcolors),
                                              ),
                                              Text(
                                                "Rp.${transaksi.total}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colordata().iconcolors,
                                                    fontSize: 20),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //====1 e=====

                                  //======2.1======
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height /
                                        4.8,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: transaksi.datayouwant.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            barangwiget(
                                                context,
                                                transaksi
                                                    .datayouwant[index].name,
                                                transaksi.datayouwant[index]
                                                    .kodeBarang,
                                                jumlahconroller);
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 4, right: 4),
                                            height: 25,

                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            // width: MediaQuery.of(context).size.width / 3,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              transaksi
                                                                  .datayouwant[
                                                                      index]
                                                                  .poto
                                                                  .toString()),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      transaksi
                                                          .removeindex(index);
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Color.fromARGB(59,
                                                                255, 193, 7),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.amber,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  //======2.1 e======

                                  //=====3====
                                  Container(
                                    color: Colors.black,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        //=====3.1=======

                                        //======3.1 e ======

                                        //=====3.1=======
                                        GestureDetector(
                                          onTap: () {
                                            // transaksi.postbulk();
                                            Get.to(Bayar());
                                            // selesaikantransaksi(
                                            //     context, selsaikanconroller);
                                          },
                                          child: (transaksi
                                                      .datayouwant.length <=
                                                  0)
                                              ? Container()
                                              : Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 50,
                                                          right: 50,
                                                          top: 10,
                                                          bottom: 10),
                                                  decoration: BoxDecoration(
                                                      color: Colordata()
                                                          .iconcolors,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Center(
                                                    child: Text(
                                                      "Selsai",
                                                      style: TextStyle(
                                                          color: Colordata()
                                                              .texcolors,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                        )
                                        //=======3.1 e====
                                      ],
                                    ),
                                  )
                                  //====2 e=====
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  await controller?.resumeCamera();
                                  transaksi.codetrue(false);
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                )),
                            GestureDetector(
                              onTap: () async {
                                await controller?.toggleFlash();
                                setState(() {});
                              },
                              child: FutureBuilder(
                                future: controller?.getFlashStatus(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == true) {
                                    return const Icon(
                                      Icons.flash_on,
                                      color: Colors.amber,
                                    );
                                  } else {
                                    return const Icon(
                                      Icons.flash_off,
                                      color: Colors.amber,
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller

    return QRView(
      key: qrKeytransaksi,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colordata().iconcolors,
          borderRadius: 0,
          borderLength: 10,
          borderWidth: 5,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    Transaksikontroller transaksi = Get.put(Transaksikontroller());
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      // Timer(const Duration(seconds: 1), () {
      if (scanData.code != null) {
        if (transaksi.codetrue.isTrue) {
          controller.pauseCamera();
        } else {
          transaksi.addbarang(scanData.code);
        }
      }
      // });

      // setState(() {
      //   result = scanData;
      // });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
