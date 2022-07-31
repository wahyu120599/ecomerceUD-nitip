import 'package:get/get.dart';
import 'package:udmurahmotor/core/data/model/listtransaksi/listtransaksimodel.dart';
import 'package:udmurahmotor/future/apiservice/serviceapi/listransaksi/listransaksiservice.dart';

class TransaksiController extends GetxController {
  Listransaksiservice listransaksiservice = Listransaksiservice();
  ListransaksiModel listransaksiModel = ListransaksiModel();
  RxBool isLoading = false.obs;

  getlist(limmit, offset) async {
    isLoading(true);
    try {
      await listransaksiservice.getlistransaksi(limmit, offset).then((value) {
        if (value.data!.isNotEmpty) {
          listransaksiModel = value;
          isLoading(false);
        }
        print(listransaksiModel);
        update();
        isLoading(false);
      });
    } catch (e) {
      print(e);
      isLoading(false);
    }
  }
}
