import 'package:udmurahmotor/core/utils/baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../../core/data/model/updatebarang/updatebarang.dart';

class UpdateBarangservice {
  UpdatebarangModel updatebarangModel = UpdatebarangModel();

  Future<UpdatebarangModel> updatebarang(id, name, jumlah, harga) async {
    Baseurl baseurl = Baseurl();
    var time = DateTime.now().toString();
    var body = {
      "updateAt": time,
      "name": name,
      "jumlah": jumlah,
      "harga": harga,
      "Status": "1"
    };
    var header = {"Content-Type": "application/json"};
    final update = await http.post(Uri.parse(baseurl.url("/updateBarang/$id")),
        body: convert.jsonEncode(body), headers: header);

    if (update.statusCode == 201) {
      updatebarangModel =
          UpdatebarangModel.fromJson(convert.jsonDecode(update.body));
      return updatebarangModel;
    } else {
      return updatebarangModel;
    }
  }
}
