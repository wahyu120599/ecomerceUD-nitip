import 'package:udmurahmotor/core/utils/baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../../../core/data/model/detaijumlahbarangModel/detailjumlahBarangModel.dart';
import '../../../../core/data/model/getdatailbarangmodel/getdetailbarangmodel.dart';

class Detailjumlahbarangserv {
  Baseurl baseurl = Baseurl();
  Future<DetailbarangTerjuaModel> getbarangbyid(id) async {
    DetailbarangTerjuaModel detailbarangTerjuaModel = DetailbarangTerjuaModel();
    final get =
        await http.get(Uri.parse(baseurl.url("/getterjualbybarangid/$id")));
    if (get.statusCode == 201) {
      print("baranggggggg======");
      print(get.body);
      detailbarangTerjuaModel =
          DetailbarangTerjuaModel.fromJson(convert.jsonDecode(get.body));
      return detailbarangTerjuaModel;
    } else {
      return detailbarangTerjuaModel;
    }
  }
}
