import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/getkelengkapan.dart';

class Kelengkapanservice {
  Future postkelengkapan(dokumen, barangid) async {
    var url = "https://endpoindud.devmee.tech/createkelengkapan";
    var body = {"dokumen": dokumen, "BarangId": barangid.toString()};
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

  Future<List<Datakelengkapan>> getkelengkapan(idbarang) async {
    var id = idbarang;
    var url = "https://endpoindud.devmee.tech/readkelengkapan/${id}";
    List<Datakelengkapan> datakel = [];
    var get = await http.get(Uri.parse(url));

    if (get.statusCode == 200) {
      var responsejson = convert.jsonDecode(get.body);
      Getkelengkapan getdata = Getkelengkapan.fromjson(responsejson);
      getdata.datakelengkapan?.forEach((v) {
        datakel.add(v);
      });
      return datakel;
    } else {
      return datakel;
    }
  }

  Future updatekelengkapan(dokumen, id) async {
    var iddata = id;
    var url = "https://endpoindud.devmee.tech/updatekelengkapan/${iddata}";
    var body = {"dokumen": dokumen};
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

  Future deletekelengkapan(id) async {
    var iddata = id;
    var url = "https://endpoindud.devmee.tech/deletkelengkapanbyid/${iddata}";
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
