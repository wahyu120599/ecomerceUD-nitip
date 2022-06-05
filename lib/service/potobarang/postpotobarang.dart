import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Postpotobarangs {
  Future postdatapotobarang(potobarang, barangId) async {
    var url = "https://endpoindud.devmee.tech/createptobarang";
    var post = http.MultipartRequest("POST", Uri.parse(url));

    post.fields["BarangId"] = barangId.toString();
    post.files
        .add(await http.MultipartFile.fromPath("potobarang", potobarang.path));

    var response = await post.send();
    var responsd = await http.Response.fromStream(response);
    final resdata = convert.json.decode(responsd.body);

    if (response.statusCode == 200) {
      print(resdata["mesage"]);
      return resdata;
    }
  }
}
