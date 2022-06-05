import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../../model/registrasi.dart';

class Registrasi {
  Future createOtpserv(email) async {
    // var url = "http://endpoindud.devmee.tech/otp";
    var url = "https://endpoindud.devmee.tech/otp";
    var header = {
      "Content-Type": "application/x-www-form-urlencoded",
    };
    var body = {"email": email};
    var post = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
      encoding: convert.Encoding.getByName('utf-8'),
    );
    if (post.statusCode == 200) {
      print(post.body);
      final resdata = convert.json.decode(post.body);
      return resdata;
    } else {
      final resdata = convert.json.decode(post.body);
      print(resdata);
      return resdata;
    }
  }

  Future<Reguser> Registrasiserv(nama, username, password, email, no_telpon,
      no_wa, RoltableId, otp) async {
    var otpdata = otp;

    var body = {
      "nama": nama,
      "username": username,
      "password": password,
      "email": email,
      "no_telpon": no_telpon,
      "no_wa": no_wa,
      "RoltableId": "1",
    };

    var url = "https://endpoindud.devmee.tech/registrasi/${otpdata}";
    var post = await http.post(
      Uri.parse(url),
      body: body,
      encoding: convert.Encoding.getByName('utf-8'),
    );

    if (post.statusCode == 200) {
      final resdata = convert.json.decode(post.body);
      print("sssss");
      // print(post.body.toString());
      return Reguser.fromjson(convert.jsonDecode(post.body));
    } else {
      print("eeeee");
      print(post.body.toString());
      final resdata = convert.json.decode(post.body);
      return Reguser.fromjson(convert.jsonDecode(post.body));
      // return convert.jsonDecode(post.body);
    }
  }
}
