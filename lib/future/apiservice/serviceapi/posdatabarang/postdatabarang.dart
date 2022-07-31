import 'package:udmurahmotor/core/utils/baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../../core/data/model/postbarang/postdatabarang.dart';

class PostDatabarangservice {
  Baseurl baseurl = Baseurl();
  Future<Posdatabarangmodel> postdatabarangserv(updateAt, name, createAt,
      jumlah, harga, kodeBarang, potobarang, status) async {
    Posdatabarangmodel posdatabarangmodel = Posdatabarangmodel();
    final postBarang =
        http.MultipartRequest("POST", Uri.parse(baseurl.url("/createnBarang")));
    postBarang.fields["createAt"] = updateAt.toString();
    postBarang.fields["name"] = name.toString();
    postBarang.fields["updateAt"] = updateAt.toString();
    postBarang.fields["jumlah"] = jumlah.toString();
    postBarang.fields["harga"] = harga.toString();
    postBarang.fields["kodeBarang"] = kodeBarang.toString();
    postBarang.files
        .add(await http.MultipartFile.fromPath("potobarang", potobarang));
    postBarang.fields["Status"] = status.toString();
    var res = await postBarang.send();
    var respondata = await http.Response.fromStream(res);
    final datares = convert.jsonDecode(respondata.body);

    if (res.statusCode == 2001) {
      posdatabarangmodel = Posdatabarangmodel.fromJson(datares);
      return posdatabarangmodel;
    } else {
      return posdatabarangmodel;
    }
  }
}
