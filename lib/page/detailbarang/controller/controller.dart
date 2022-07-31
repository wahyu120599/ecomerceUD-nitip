import 'package:get/get.dart';
import 'package:udmurahmotor/future/apiservice/serviceapi/getbarangdetail/getbarangdetailservice.dart';

import '../../../core/data/model/detaijumlahbarangModel/detailjumlahBarangModel.dart';
import '../../../core/data/model/getdatailbarangmodel/getdetailbarangmodel.dart';
import '../../../future/apiservice/serviceapi/detailjumlahbarang/detailjumlahbarangservis.dart';

class Detailcontroller extends GetxController {
  RxBool isloading = true.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getdatabarag();
  // }
  GetbarangdetailModel getbarangdetailModel = GetbarangdetailModel();
  getdatabarag(id) {
    isloading(true);
    try {
      Getdetailbarang().getbarangbyid(id).then((value) async {
        getbarangdetailModel = value;
        await getterjual(id);
        isloading(false);
        update();
      });
    } catch (e) {
      isloading(false);
    }
  }

  Detailjumlahbarangserv detailjumlahbarangserv = Detailjumlahbarangserv();
  DetailbarangTerjuaModel detailbarangTerjuaModel = DetailbarangTerjuaModel();
  RxInt terjualdalamrupiah = 0.obs;
  getterjual(id) {
    try {
      detailjumlahbarangserv.getbarangbyid(id).then((value) {
        detailbarangTerjuaModel = value;
        var length = value.data?.length;
        var harga = getbarangdetailModel.harga;
        // if (harga != null || length! < 0) {
        var totalharga = harga! * length!;
        terjualdalamrupiah(totalharga);
        // }
      });
    } catch (e) {
      print(e);
    }
  }
}
