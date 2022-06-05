import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Deleteorder {
  Future deleteorders(id) async {
    var url = "https://endpoindud.devmee.tech/deleteorder/${id}";
    var del = await http.post(Uri.parse(url));
    if (del.statusCode == 200) {
      return convert.jsonDecode(del.body);
    } else {
      print("erorrrr1");
      print(convert.jsonDecode(del.body));
      return convert.jsonDecode(del.body);
    }
  }
}
