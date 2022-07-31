import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/data/model/getdatailbarangmodel/getdetailbarangmodel.dart';
import '../../../future/apiservice/serviceapi/getbarangdetail/getbarangdetailservice.dart';
import '../../../future/apiservice/serviceapi/updaterbarang/updatebarangservice.dart';
import '../../detailbarang/controller/controller.dart';
import '../../listbarang/apicontroller/getapicontroller.dart';

class Updatebarang extends GetxController {
  RxBool isloading = true.obs;
  TextEditingController namacontroler = TextEditingController();
  TextEditingController hargacontroler = TextEditingController();
  TextEditingController jumlahcontroler = TextEditingController();
  GetbarangdetailModel getbarangdetailModel = GetbarangdetailModel();
  getdatabarag(id) {
    isloading(true);
    try {
      Getdetailbarang().getbarangbyid(id).then((value) {
        getbarangdetailModel = value;
        namacontroler.text = value.name.toString();
        hargacontroler.text = value.harga.toString();
        jumlahcontroler.text = value.jumlah.toString();
        isloading(false);
        update();
      });
    } catch (e) {
      isloading(false);
    }
  }

  tobilbulat(v) {
    var titik = v.split(".");
    var join1 = titik.join("");
    var koma = join1.split(",");
    var joind2 = koma.join("");
    return joind2;
  }

  Detailcontroller detailscontroller = Get.put(Detailcontroller());
  Getlisapibarang getlisapibarang = Get.put(Getlisapibarang());
  updatebarang(id, name, jumlah, harga) {
    UpdateBarangservice()
        .updatebarang(id, name, int.parse(tobilbulat(jumlah)),
            int.parse(tobilbulat(harga)))
        .then((value) {
      getdatabarag(id);
      detailscontroller.getdatabarag(id);
      getlisapibarang.getlisbarang();
    });
  }
}
