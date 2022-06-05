import '../../model/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Loginservice {
  Future<Loginmodel> loginerv(useremail, password) async {
    var url = "https://endpoindud.devmee.tech/login";
    var body = {
      "usernameemail": useremail,
      "password": password,
    };

    var login = await http.post(Uri.parse(url), body: body);

    if (login.statusCode == 200) {
      return Loginmodel.fromjson(convert.jsonDecode(login.body));
    } else {
      return Loginmodel.fromjson(convert.jsonDecode(login.body));
    }
  }
}
