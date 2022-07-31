import 'package:udmurahmotor/core/utils/baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../../../core/data/model/transaksimodel/transaksimodel.dart';

class TransaksiService {
  Baseurl baseurl = Baseurl();
  Future<TransaksiModel> createtransaksi(List data) async {
    TransaksiModel transaksiModel = TransaksiModel();
    var body = [
      {
        "createAt": "07/05/2020",
        "updaeAt": "",
        "BarangId": 17,
        "kodeTransaksi": "2310304820023030ASCT45503XA097UIYRacc",
        "Status": "1"
      },
      {
        "createAt": "07/05/2020",
        "updaeAt": "",
        "BarangId": 18,
        "kodeTransaksi": "2310304820023030ASCT45503XA097UIYRWAH",
        "Status": "1"
      }
    ];
    var header = {"Content-Type": "application/json"};
    final post = await http.post(Uri.parse(baseurl.url("/createjualbulk")),
        body: convert.jsonEncode(data), headers: header);

    if (post.statusCode == 201) {
      print("2001 okeeee");
      transaksiModel = TransaksiModel.fromJson(convert.jsonDecode(post.body));
      print(post.body);
      return transaksiModel;
    } else {
      print("not okee");
      return transaksiModel;
    }
  }
}
