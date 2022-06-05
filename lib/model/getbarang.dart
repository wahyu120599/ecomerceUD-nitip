class GetBarang {
  String? mesage;
  int? limit;
  int? offset;
  List<DataBarang>? data;

  GetBarang({this.mesage, this.limit, this.offset, this.data});

  factory GetBarang.fromJson(Map<String, dynamic> json) {
    return GetBarang(
      mesage: json['mesage'],
      limit: json['limit'],
      offset: json['offset'],
      data: (json["data"] != null)
          ? List<DataBarang>.from(
              json["data"].map((x) => DataBarang.fromJson(x)))
          : [],
    );
  }
}

class DataBarang {
  int? id;
  String? namabarang;
  int? harga;
  String? noPlat;
  String? keterangan;
  String? thumnails;
  int? kategoribarangId;
  String? createdAt;
  String? updatedAt;
  // Kategoribarang? kategoribarang;

  DataBarang({
    this.id,
    this.namabarang,
    this.harga,
    this.noPlat,
    this.keterangan,
    this.thumnails,
    this.kategoribarangId,
    this.createdAt,
    this.updatedAt,
    // this.kategoribarang
  });

  factory DataBarang.fromJson(Map<String, dynamic> json) {
    return DataBarang(
      id: json['id'],
      namabarang: json['namabarang'],
      harga: json['harga'],
      noPlat: json['no_plat'],
      keterangan: json['keterangan'],
      thumnails: json['thumnails'],
      kategoribarangId: json['KategoribarangId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      // kategoribarang: Kategoribarang.fromJson(json["kategoribarang"])
    );
  }
}

class Potobarang {
  int? id;
  String? imagepath;
  int? barangId;
  String? createdAt;
  String? updatedAt;

  Potobarang(
      {this.id, this.imagepath, this.barangId, this.createdAt, this.updatedAt});

  factory Potobarang.fromJson(Map<String, dynamic> json) {
    return Potobarang(
      id: json['id'],
      imagepath: json['imagepath'],
      barangId: json['BarangId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Kategoribarang {
  int? id;
  String? namakategori;
  String? createdAt;
  String? updatedAt;

  Kategoribarang({this.id, this.namakategori, this.createdAt, this.updatedAt});

  factory Kategoribarang.fromJson(Map<String, dynamic> json) {
    return Kategoribarang(
      id: json['id'],
      namakategori: json['namakategori'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
