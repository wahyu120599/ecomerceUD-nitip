import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:udmurahmotor/core/matrialwiget/materialcolor.dart';
import 'package:udmurahmotor/page/postbarang/postform.dart';

class Postdatabarang extends StatefulWidget {
  const Postdatabarang({Key? key}) : super(key: key);

  @override
  State<Postdatabarang> createState() => _PostdatabarangState();
}

class _PostdatabarangState extends State<Postdatabarang> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool camerastatus = true;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          _buildQrView(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10,
              color: Color.fromARGB(17, 255, 193, 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  (camerastatus == true)
                      ? Container()
                      : GestureDetector(
                          onTap: () async {
                            await controller?.resumeCamera();
                            setState(() {
                              camerastatus = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.amber)),
                            child: Text(
                              "Scan lagi",
                              style: TextStyle(color: Colordata().texcolors),
                            ),
                          ),
                        ),
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      icon: FutureBuilder(
                          future: controller?.getFlashStatus(),
                          builder: (context, snapshot) {
                            return Icon(
                              (snapshot.data == true)
                                  ? Icons.flash_on
                                  : Icons.flash_off,
                              color: Colors.white,
                            );
                          }))
                ],
              ),
            ),
          )
        ]),
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
      key: qrKey,
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
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.code != null) {
        await controller.pauseCamera();
        setState(() {
          camerastatus = false;
        });
        Get.to(() => Formpostbarang(
              codebarang: scanData.code.toString(),
            ));
      }
      setState(() {
        result = scanData;
      });
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
