import 'package:get/get.dart';

class Qrpagestate extends GetxController {
  RxBool iscameraon = true.obs;
  setcamera() {
    if (iscameraon.isTrue) {
      iscameraon(false);
    } else {
      iscameraon(true);
    }
  }
}
