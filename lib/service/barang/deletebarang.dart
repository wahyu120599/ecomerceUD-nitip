import 'dart:convert';

import 'package:http/http.dart' as http;

class Deletebarang {
  Future deletedatabarang(id) async {
    var idbarang = id;
    print(idbarang);
    var url = "https://endpoindud.devmee.tech/deletebarang/${idbarang}";
    var delete = await http.post(Uri.parse(url));
    if (delete.statusCode == 200) {
      return json.decode(delete.body);
    } else {
      json.decode(delete.body);
    }
  }
}
