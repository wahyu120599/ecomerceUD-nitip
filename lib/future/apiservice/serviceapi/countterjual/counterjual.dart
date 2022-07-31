import '../../../../core/data/model/countterjual/countterjual.dart';
import 'package:udmurahmotor/core/utils/baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Countterjualservice {
  CountTerjual countTerjual = CountTerjual();
  Future<CountTerjual> getacounterjual() async {
    Baseurl baseurl = Baseurl();
    final get = await http.get(Uri.parse(baseurl.url("/getcountterjual")));

    if (get.statusCode == 201) {
      countTerjual = CountTerjual.fromJson(convert.jsonDecode(get.body));
      return countTerjual;
    } else {
      return countTerjual;
    }
  }
}
