import 'package:udmurahmotor/core/utils/baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../../core/data/model/countbarang/countbarang.dart';

class Countbarangservice {
  Baseurl baseurl = Baseurl();
  Future<CountBarang> getacountbarang() async {
    CountBarang countBarang = CountBarang();
    final get = await http.get(Uri.parse(baseurl.url("/getcounalltbarang")));

    if (get.statusCode == 201) {
      countBarang = CountBarang.fromJson(convert.jsonDecode(get.body));
      return countBarang;
    } else {
      return countBarang;
    }
  }
}
