import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/data/model/postbarang/postdatabarang.dart';
import '../../../future/apiservice/serviceapi/posdatabarang/postdatabarang.dart';
import 'dart:math';
import 'dart:convert';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class PostdatabarangController extends GetxController {
  PostDatabarangservice postDatabarangservice = PostDatabarangservice();
  Posdatabarangmodel posdatabarangmodel = Posdatabarangmodel();
  String getBase64RandomString(int length) {
    var time = DateTime.now();
    var random = Random.secure();
    var values = List<int>.generate(length, (i) => random.nextInt(255));
    var base64 = base64UrlEncode(values);
    return "$base64${time.second}${time.day}";
  }

  RxBool isLoading = false.obs;
  RxBool isfile = false.obs;
  final ImagePicker _picker = ImagePicker();
  XFile? filedata;

  Future pikfile(type) async {
    isfile(false);
    if (type == "camera") {
      XFile? _image =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      if (_image != null) {
        // imagedata(Value)
        filedata = _image;
        isfile(true);
        return XFile(_image.path);
      }
    } else {
      XFile? _image = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);
      if (_image != null) {
        filedata = _image;
        isfile(true);
        return XFile(_image.path);
      }
    }
  }

  Future postdatabarang<Posdatabarangmodel>(
      name, jumlah, harga, potobarang, codebarang) async {
    isLoading(true);
    await postDatabarangservice
        .postdatabarangserv(DateTime.now(), name, DateTime.now(), jumlah, harga,
            codebarang, potobarang, 1)
        .then((value) {
      if (value.message == "berhasil tambah data") {
        posdatabarangmodel = value;
        isLoading(false);
        return posdatabarangmodel;
      } else {
        isLoading(false);
      }
    });
  }
}
