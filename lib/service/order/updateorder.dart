import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Addbarang {
  Future updatestatusorder(
      BarangId, UserTableId, statusorder, alamatkirim) async {
    var url = "https://endpoindud.devmee.tech/updaterorder";
    var body = {
      "BarangId": BarangId.toString(),
      "UserTableId": UserTableId.toString(),
      "statusorder": statusorder.toString(),
      "alamatkirim": alamatkirim,
      "orderdate": DateTime.now().toString(),
    };
    var post = await http.post(Uri.parse(url), body: body);
    if (post.statusCode == 200) {
      // var responsejson = convert.jsonDecode(get.body);
      // GetBarang getdata = GetBarang.fromJson(responsejson);
      // getdata.data?.forEach((v) {
      //   databarang.add(v);
      // });
      // return GetBarang.fromJson(responsejson);
      return convert.jsonDecode(post.body);
    } else {
      print(convert.jsonDecode(post.body));
      return convert.jsonDecode(post.body);
      // return GetBarang.fromJson(convert.jsonDecode(get.body));
    }
  }
}
