// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals

class Getlisdatabarang {
  int? limit;
  int? offset;
  int? jumlah;
  List<Data>? data;

  Getlisdatabarang({this.limit, this.offset, this.jumlah, this.data});

  Getlisdatabarang.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    jumlah = json['jumlah'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['jumlah'] = this.jumlah;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? createAt;
  String? updateAt;
  String? name;
  int? jumlah;
  int? harga;
  String? kodeBarang;
  String? poto;
  String? status;

  Data(
      {this.id,
      this.createAt,
      this.updateAt,
      this.name,
      this.jumlah,
      this.harga,
      this.kodeBarang,
      this.poto,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    name = json['name'];
    jumlah = json['jumlah'];
    harga = json['harga'];
    kodeBarang = json['kodeBarang'];
    poto = json['poto'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createAt'] = this.createAt;
    data['updateAt'] = this.updateAt;
    data['name'] = this.name;
    data['jumlah'] = this.jumlah;
    data['harga'] = this.harga;
    data['kodeBarang'] = this.kodeBarang;
    data['poto'] = this.poto;
    data['Status'] = this.status;
    return data;
  }
}
