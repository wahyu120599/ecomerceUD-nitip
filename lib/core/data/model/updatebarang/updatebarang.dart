class UpdatebarangModel {
  String? message;
  Data? data;

  UpdatebarangModel({this.message, this.data});

  UpdatebarangModel.fromJson(Map<String, dynamic> json) {
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
  String? updateAt;
  String? name;
  int? jumlah;
  int? harga;
  String? kodeBarang;
  String? status;

  Data(
      {this.updateAt,
      this.name,
      this.jumlah,
      this.harga,
      this.kodeBarang,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    updateAt = json['updateAt'];
    name = json['name'];
    jumlah = json['jumlah'];
    harga = json['harga'];
    kodeBarang = json['kodeBarang'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updateAt'] = this.updateAt;
    data['name'] = this.name;
    data['jumlah'] = this.jumlah;
    data['harga'] = this.harga;
    data['kodeBarang'] = this.kodeBarang;
    data['Status'] = this.status;
    return data;
  }
}
