import 'package:http/http.dart' as http;
import 'package:udmurahmotor/model/getkategoribarangbyid.dart';
import 'dart:convert' as convert;

import '../../model/getkategoribarang.dart';

class Kategoribarangserv {
  Future postkategori(
    kategoriname,
  ) async {
    var url = "https://endpoindud.devmee.tech/postkategoribarang";
    var body = {
      "namakategori": kategoriname,
    };
    var header = {
      "Content-Type": "application/x-www-form-urlencoded",
    };
    var post = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
      encoding: convert.Encoding.getByName('utf-8'),
    );

    if (post.statusCode == 200) {
      final resdata = convert.json.decode(post.body);
      return resdata;
    }
  }

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

  Future<Getkategoribyid> getkategoribyid(id) async {
    var url = "https://endpoindud.devmee.tech/getkategoribarangbyid/${id}";
    var get = await http.get(Uri.parse(url));
    if (get.statusCode == 200) {
      print("get kategori 200 ok");
      return Getkategoribyid.fromjson(convert.jsonDecode(get.body));
    }
    return Getkategoribyid.fromjson(convert.jsonDecode(get.body));
  }

  Future deletekategori(
    id,
  ) async {
    var iddata = id;
    var url = "https://endpoindud.devmee.tech/deletekategoribarang/${iddata}";

    var header = {
      "Content-Type": "application/x-www-form-urlencoded",
    };
    var post = await http.post(
      Uri.parse(url),
      headers: header,
      encoding: convert.Encoding.getByName('utf-8'),
    );

    if (post.statusCode == 200) {
      final resdata = convert.json.decode(post.body);
      return resdata;
    }
  }
}
