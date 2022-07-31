// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class Posdatabarangmodel {
  String? message;
  Data? data;

  Posdatabarangmodel({this.message, this.data});

  Posdatabarangmodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? createAt;
  String? updateAt;
  String? name;
  String? jumlah;
  String? harga;
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
