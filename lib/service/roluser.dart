import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/getrool.dart';
import '../model/rolluser.dart';

class Roolservice {
  Future<postrool> createrool(namerol) async {
    postrool rol = postrool();
    try {
      var url = "http://endpoindud.devmee.tech/postrol";
      var post = await http.post(Uri.parse(url), body: {"rolname": namerol});
      if (post.statusCode == 200) {
        rol = postrool.fromJson(convert.jsonDecode(post.body));
        return rol;
      }
      return rol;
    } catch (err) {
      return rol;
    }
  }

  Future<List<Datarool>> getrool() async {
    List<Datarool> datarol = [];
    try {
      var url = "https://endpoindud.devmee.tech/getrol";
      var get = await http.get(Uri.parse(url));
      if (get.statusCode == 200) {
        var responsejson = convert.jsonDecode(get.body);
        Getrool getdata = Getrool.fromJson(responsejson);
        getdata.data?.forEach((v) {
          datarol.add(v);
        });
        return datarol;
      }
      return datarol;
    } catch (err) {
      return datarol;
    }
  }
}
