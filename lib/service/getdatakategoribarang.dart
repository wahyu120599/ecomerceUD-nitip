import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/getkategoribarang.dart';

class Getdatakatebarang {
  Future<List<Datakategori>> getkatebarang() async {
    List<Datakategori> databarang = [];
    var url = "https://endpoindud.devmee.tech/getkategoribarang";
    var get = await http.get(Uri.parse(url));
    if (get.statusCode == 200) {
      var responsejson = convert.jsonDecode(get.body);
      Getkategoribarang getdata = Getkategoribarang.fromjson(responsejson);
      getdata.data?.forEach((v) {
        databarang.add(v);
      });
      return databarang;
    } else {
      return databarang;
    }
  }
}
