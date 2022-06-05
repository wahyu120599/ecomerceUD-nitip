class PostBarang {
  String? mesage;
  GetDatabarang? getDatabarang;

  PostBarang({this.mesage, this.getDatabarang});

  factory PostBarang.fromjson(Map<String, dynamic> json) {
    return PostBarang(
        mesage: json['mesage'],
        getDatabarang: (json['data'] != null)
            ? GetDatabarang.fromjson(json['data'])
            : GetDatabarang.fromjson(json));
  }
}

class GetDatabarang {
  int? id;
  String? namabarang;
  double? harga;
  String? no_plat;
  String? keterangan;
  String? thumnails;
  int? KategoribarangId;

  GetDatabarang(
      {this.id,
      this.namabarang,
      this.harga,
      this.no_plat,
      this.keterangan,
      this.thumnails,
      this.KategoribarangId});

  factory GetDatabarang.fromjson(Map<String, dynamic> json) {
    return GetDatabarang(
        id: json['id'],
        namabarang: json['namabarang'],
        harga: json['harga'],
        no_plat: json['no_plat'],
        keterangan: json['keterangan'],
        thumnails: json['thumnails'],
        KategoribarangId: json['KategoribarangId']);
  }
}
