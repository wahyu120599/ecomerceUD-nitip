import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../model/postbarng.dart';

class Postbarangs {
  Future postdatabarang(namabarang, harga, no_plat, keterangan, thumnails,
      kategoribarangId) async {
    PostBarang barang = PostBarang();
    var url = "https://endpoindud.devmee.tech/postbarang";
    var post = http.MultipartRequest("POST", Uri.parse(url));
    post.fields["namabarang"] = namabarang.toString();
    post.fields["harga"] = harga.toString();
    post.fields["no_plat"] = no_plat.toString();
    post.fields["keterangan"] = keterangan.toString();
    post.fields["KategoribarangId"] = kategoribarangId.toString();
    post.files.add(await http.MultipartFile.fromPath("thumnails", thumnails));

    var response = await post.send();
    var responsd = await http.Response.fromStream(response);
    final resdata = convert.json.decode(responsd.body);

    if (response.statusCode == 200) {
      print(resdata["mesage"]);
      return resdata;
    }
  }
}
