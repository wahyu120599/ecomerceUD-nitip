import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../model/getkomfir.dart';

class Komfirmasibayar {
  Future cretekomfir(nama, email, no_wa, no_telp) async {
    var url = "https://endpoindud.devmee.tech/createKonfirmasi";
    var body = {
      "nama": nama,
      "email": email,
      "no_wa": no_wa,
      "no_telpon": no_telp,
    };
    var post = await http.post(Uri.parse(url), body: body);
    if (post.statusCode == 200) {
      return convert.jsonDecode(post.body);
    } else {
      print(convert.jsonDecode(post.body));
      return convert.jsonDecode(post.body);
    }
  }

  Future updatekomfir(nama, email, no_wa, no_telp, id) async {
    var url = "https://endpoindud.devmee.tech/updatekonfirmasi/${id}";
    var body = {
      "nama": nama,
      "email": email,
      "no_wa": no_wa,
      "no_telpon": no_telp,
    };
    var post = await http.post(Uri.parse(url), body: body);
    if (post.statusCode == 200) {
      return convert.jsonDecode(post.body);
    } else {
      print(convert.jsonDecode(post.body));
      return convert.jsonDecode(post.body);
    }
  }

  Future<Getkomfirmasi> getkomfir() async {
    var url = "https://endpoindud.devmee.tech/getKonfirmasi";

    var post = await http.get(Uri.parse(url));
    if (post.statusCode == 200) {
      print(convert.jsonDecode(post.body));
      // return convert.jsonDecode(post.body);
      var comvertdata = convert.jsonDecode(post.body);
      return Getkomfirmasi.fromjson(comvertdata);
    } else {
      print(convert.jsonDecode(post.body));
      // return convert.jsonDecode(post.body);
      var comvertdata = convert.jsonDecode(post.body);
      return Getkomfirmasi.fromjson(comvertdata);
    }
  }
}
