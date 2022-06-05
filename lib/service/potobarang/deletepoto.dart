import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future deletepotobarang(id) async {
  var iddata = id;
  var url = "https://endpoindud.devmee.tech/deletepotobarangbyid/${iddata}";
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
