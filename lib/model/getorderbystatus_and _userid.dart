class Orders {
  String? mesage;
  List<Dataorder>? data;

  Orders({this.mesage, this.data});
  factory Orders.fromjson(Map<String, dynamic> json) {
    return Orders(
        mesage: json['mesage'],
        data: List<Dataorder>.from(
            json['data'].map((x) => Dataorder.fromjson(x))));
  }
}

class Dataorder {
  int? id;
  int? BarangId;
  int? UserTableId;
  int? statusorder;
  String? alamatkirim;
  String? orderdate;
  String? ordercode;
  Barangorder? barang;

  Dataorder(
      {this.id,
      this.BarangId,
      this.UserTableId,
      this.statusorder,
      this.alamatkirim,
      this.orderdate,
      this.ordercode,
      this.barang});

  factory Dataorder.fromjson(Map<String, dynamic> json) {
    return Dataorder(
        id: json['id'],
        BarangId: json['BarangId'],
        UserTableId: json['UserTableId'],
        statusorder: json['statusorder'],
        alamatkirim: json['alamatkirim'],
        ordercode: json['ordercode'],
        orderdate: json['orderdate'],
        barang: Barangorder.fromjson(json['barang']));
  }
}

class Barangorder {
  int? id;
  String? namabarang;
  int? harga;
  String? no_plat;
  String? keterangan;
  String? thumnails;
  int? KategoribarangId;

  Barangorder(
      {this.id,
      this.namabarang,
      this.harga,
      this.no_plat,
      this.keterangan,
      this.thumnails,
      this.KategoribarangId});

  factory Barangorder.fromjson(Map<String, dynamic> json) {
    return Barangorder(
        id: json['id'],
        namabarang: json['namabarang'],
        harga: json['harga'],
        no_plat: json['no_plat'],
        keterangan: json['keterangan'],
        thumnails: json['thumnails'],
        KategoribarangId: json['KategoribarangId']);
  }
}
