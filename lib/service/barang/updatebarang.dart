import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Updatebarangs {
  Future updatedatabarang(namabarang, harga, no_plat, keterangan, thumnails,
      urlthumnails, kategoribarangId, id) async {
    try {
      var idbarang = id;
      var url = "https://endpoindud.devmee.tech/updatebarang/${idbarang}";
      var post = http.MultipartRequest("POST", Uri.parse(url));
      if (thumnails != null) {
        // print("thunails tidak null");

        post.fields["namabarang"] = namabarang.toString();
        post.fields["harga"] = harga.toString();
        post.fields["no_plat"] = no_plat.toString();
        post.fields["keterangan"] = keterangan.toString();
        post.fields["KategoribarangId"] = kategoribarangId.toString();

        post.files.add(await http.MultipartFile.fromPath(
            "thumnails", thumnails.path.toString()));

        var response = await post.send();
        var responsd = await http.Response.fromStream(response);
        final resdata = convert.json.decode(responsd.body);

        if (response.statusCode == 200) {
          // print(resdata["mesage"]);
          print(resdata);
          return resdata;
        }
      } else {
        print("thumnails null");
        print(kategoribarangId);
        post.fields["namabarang"] = namabarang.toString();
        post.fields["harga"] = harga.toString();
        post.fields["no_plat"] = no_plat.toString();
        post.fields["keterangan"] = keterangan.toString();
        post.fields["KategoribarangId"] = kategoribarangId.toString();
        // post.fields["KategoribarangId"] = "79";

        post.fields["thumnails"] = urlthumnails.toString();

        var response = await post.send();
        var responsd = await http.Response.fromStream(response);
        final resdata = convert.json.decode(responsd.body);

        if (response.statusCode == 200) {
          // print(resdata["mesage"]);
          print(resdata);
          return resdata;
        }
      }
    } catch (e) {
      print("eror");
      print(e);
    }
  }
}
