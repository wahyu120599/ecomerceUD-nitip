class DetailbarangTerjuaModel {
  List<Data>? data;

  DetailbarangTerjuaModel({this.data});

  DetailbarangTerjuaModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? createAt;
  String? updaeAt;
  int? barangId;
  String? kodeTransaksi;
  String? status;

  Data(
      {this.id,
      this.createAt,
      this.updaeAt,
      this.barangId,
      this.kodeTransaksi,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createAt = json['createAt'];
    updaeAt = json['updaeAt'];
    barangId = json['BarangId'];
    kodeTransaksi = json['kodeTransaksi'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createAt'] = this.createAt;
    data['updaeAt'] = this.updaeAt;
    data['BarangId'] = this.barangId;
    data['kodeTransaksi'] = this.kodeTransaksi;
    data['Status'] = this.status;
    return data;
  }
}
