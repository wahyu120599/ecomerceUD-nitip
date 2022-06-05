import '../../model/getpotobarang.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Getpoto {
  Future<List<Datapotobarang>> getpotobarang(id) async {
    var dataid = id;
    List<Datapotobarang> poto = [];
    var url = "https://endpoindud.devmee.tech/gepotobarang/${dataid}";
    var get = await http.get(Uri.parse(url));
    if (get.statusCode == 200) {
      var responsejson = convert.jsonDecode(get.body);
      Getpotobarang getdata = Getpotobarang.fromjson(responsejson);
      getdata.databarang?.forEach((v) {
        poto.add(v);
      });
      return poto;
    } else {
      return poto;
    }
  }
}
