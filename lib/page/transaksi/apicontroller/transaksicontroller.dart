import 'dart:math';
import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:udmurahmotor/page/listbarang/listbarang.dart';

import '../../../core/data/model/listmodel/getbaranglist.dart' as Listbarang;
import '../../../core/data/model/listmodel/getbaranglist.dart ';
import '../../../core/data/model/postbarang/postdatabarang.dart';
import '../../../core/data/model/transaksimodel/transaksimodel.dart';
import '../../../future/apiservice/serviceapi/listdatabarang/apilistbarang.dart';
import '../../../future/apiservice/serviceapi/transaksiservice/transaksiservice.dart';

class Transaksikontroller extends GetxController {
  List<Listbarang.Data> datayouwant = <Listbarang.Data>[].obs;

  Apilistbarang apilistbarang = Apilistbarang();
  Listbarang.Getlisdatabarang barang = Listbarang.Getlisdatabarang();
  var isLoading = false.obs;
  RxBool codetrue = false.obs;
  RxInt datayouwantidexon = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getlisbarang();
  }

  removeindex(index) {
    datayouwant.removeAt(index);
    totalbayar();
  }

  addmasal(jumlahbarang, code) {
    int jumlah = int.parse(jumlahbarang);
    print(jumlah);
    var codebarang = code;
    var b = barang.data;
    for (int s = 0; s < barang.data!.length; s++) {
      if (codebarang == barang.data![s].kodeBarang) {
        for (int i = 0; i < jumlah; i++) {
          datayouwant.add(barang.data![s]);
        }
        break;
      }
    }
    totalbayar();
  }

  addbarang(code) {
    var codescan = code.toString();
    print(code);
    barang.data!.forEach((v) {
      var databarang = v.kodeBarang;
      if (codescan == databarang) {
        print("yessss");
        datayouwant.add(v as Listbarang.Data);
        print("dataaaaa========:$v");
        codetrue(true);
        totalbayar();
      } else {
        print("data from API ::$databarang");
        print("DATA FROM SCANN CODE :: ${code}");
        print("noooo ???");
      }
    });
  }

  getlisbarang() async {
    datayouwant.clear();
    barang.data?.clear();
    isLoading(true);
    try {
      await apilistbarang.getallbarang(5, 0).then((x) {
        barang = x;
        isLoading(false);
      });
    } catch (e) {
      print(e);
    }
  }

  TransaksiService transaksiService = TransaksiService();
  TransaksiModel transaksiModel = TransaksiModel();
  List datapost = [].obs;
  var statustransaksi = false.obs;
  var kodetransaksi = "".obs;
  final time = DateTime.now();
  postbulk() {
    statustransaksi(false);
    datapost.clear();
    var time = DateTime.now();
    var random = Random.secure();
    var rString = "${time.day}${random.hashCode}${time.year}";
    datayouwant.forEach((v) {
      datapost.add({
        "createAt": time.toString(),
        "updaeAt": "",
        "BarangId": v.id,
        "kodeTransaksi": rString,
        "Status": "1"
      });
    });

    // print(datapost);

    if (datapost.isNotEmpty) {
      createtransaksibulk(datapost);
    }
  }

  createtransaksibulk(data) async {
    try {
      print("mulaiiiii upload");
      await transaksiService.createtransaksi(data).then((value) {
        transaksiModel = value;
        statustransaksi(true);
        kodetransaksi(value.data?[0].kodeTransaksi);
        print("selesaii upload");
        print(value);
      });
    } catch (e) {
      print(e);
    }
  }

  var controlernilai = 0.obs;
  sourcut(cotrollers, value) {
    int v = value * 1000;
    cotrollers.text = v.toString();
    controlernilai(v);
    kakulasikembalian(total, controlernilai.value);
  }

  var total = 0.obs;
  totalbayar() {
    total(0);
    datayouwant.forEach((v) {
      var hargabarang = v.harga;
      total = total + hargabarang!;
    });
  }

  var k = 0.obs;
  RxInt kembalian = 0.obs;
  kakulasikembalian(totals, int uang) {
    kembalian(0);
    totalbayar();
    RxInt cuan = uang.obs;
    var hasil = cuan.value - total.value;
    kembalian(hasil);
  }
}
