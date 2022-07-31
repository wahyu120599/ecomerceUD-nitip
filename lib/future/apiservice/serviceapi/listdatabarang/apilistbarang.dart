import 'package:udmurahmotor/core/utils/baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../../core/data/model/listmodel/getbaranglist.dart';

class Apilistbarang {
  Baseurl baseurl = Baseurl();
  Future<Getlisdatabarang> getallbarang(limit, offset) async {
    Getlisdatabarang getlisdatabarang = Getlisdatabarang();
    final get = await http.get(
        Uri.parse(baseurl.url("/getallbarang?limit=$limit&offset=$offset")));

    if (get.statusCode == 201) {
      getlisdatabarang =
          Getlisdatabarang.fromJson(convert.jsonDecode(get.body));
      return getlisdatabarang;
    } else {
      return getlisdatabarang;
    }
  }
}
