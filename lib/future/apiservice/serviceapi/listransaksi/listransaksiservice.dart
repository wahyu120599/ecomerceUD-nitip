import 'package:udmurahmotor/core/utils/baseurl.dart';
import '../../../../core/data/model/listtransaksi/listtransaksimodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Listransaksiservice {
  Baseurl baseurl = Baseurl();
  Future<ListransaksiModel> getlistransaksi(limit, offset) async {
    ListransaksiModel listransaksiModel = ListransaksiModel();
    var getlist = await http.get(
        Uri.parse(baseurl.url("/geallterjual?limit=$limit&offset=$offset")));

    if (getlist.statusCode == 201) {
      final convertdata = convert.jsonDecode(getlist.body);
      listransaksiModel = ListransaksiModel.fromJson(convertdata);
      print("====================data========================");
      print(getlist.body);
      return listransaksiModel;
    } else {
      print("====================data0000========================");
      return listransaksiModel;
    }
  }
}
