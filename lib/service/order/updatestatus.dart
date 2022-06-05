import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Addbarang {
  Future updatestatusorder(statusorder, id) async {
    var url = "https://endpoindud.devmee.tech/updaterorderstatus/${id}";
    var body = {
      "statusorder": statusorder.toString(),
    };
    var post = await http.post(Uri.parse(url), body: body);
    if (post.statusCode == 200) {
      return convert.jsonDecode(post.body);
    } else {
      print(convert.jsonDecode(post.body));
      return convert.jsonDecode(post.body);
    }
  }
}
