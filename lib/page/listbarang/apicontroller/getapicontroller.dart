import 'package:get/get.dart';

import '../../../core/data/model/listmodel/getbaranglist.dart';
import '../../../future/apiservice/serviceapi/listdatabarang/apilistbarang.dart';

class Getlisapibarang extends GetxController {
  Apilistbarang apilistbarang = Apilistbarang();
  var getlisdatabarang = <Getlisdatabarang>{}.obs;
  Getlisdatabarang v = Getlisdatabarang();
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getlisbarang();
  }

  getlisbarang() async {
    isLoading(true);
    // v = v;
    try {
      await apilistbarang.getallbarang(5, 0).then((x) {
        v = x;
        isLoading(false);
        print(v.data);
        print(x.jumlah);
      });
    } catch (e) {
      print(e);
    }
  }
}
