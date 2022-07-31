import 'package:udmurahmotor/core/utils/baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../../core/data/model/getdatailbarangmodel/getdetailbarangmodel.dart';

class Getdetailbarang {
  Baseurl baseurl = Baseurl();
  Future<GetbarangdetailModel> getbarangbyid(id) async {
    GetbarangdetailModel getbarangdetailModel = GetbarangdetailModel();
    final get = await http.get(Uri.parse(baseurl.url("/getbyidbarang/$id")));
    if (get.statusCode == 201) {
      getbarangdetailModel =
          GetbarangdetailModel.fromJson(convert.jsonDecode(get.body));
      return getbarangdetailModel;
    } else {
      return getbarangdetailModel;
    }
  }
}
