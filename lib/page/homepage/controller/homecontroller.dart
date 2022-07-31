import 'package:get/get.dart';

import '../../../core/data/model/countbarang/countbarang.dart';
import '../../../core/data/model/countterjual/countterjual.dart';
import '../../../future/apiservice/serviceapi/countbarang/countbarangservice.dart';
import '../../../future/apiservice/serviceapi/countterjual/counterjual.dart';

class Homecontroller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getcountbarang();
    getterjual();
  }

  Countbarangservice countbarangservice = Countbarangservice();
  CountBarang countBarang = CountBarang();
  RxBool loadingbarang = false.obs;
  getcountbarang() {
    loadingbarang(true);
    countbarangservice.getacountbarang().then((value) {
      countBarang = value;
      loadingbarang(false);
    });
  }

  Countterjualservice countterjualservice = Countterjualservice();
  CountTerjual countTerjual = CountTerjual();
  RxBool loadingerjual = false.obs;
  getterjual() {
    loadingerjual(true);
    countterjualservice.getacounterjual().then((value) {
      countTerjual = value;
      loadingerjual(false);
    });
  }
}
