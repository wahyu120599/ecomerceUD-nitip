class GetbarangdetailModel {
  int? id;
  String? createAt;
  String? updateAt;
  String? name;
  int? jumlah;
  int? harga;
  String? kodeBarang;
  String? poto;
  String? status;

  GetbarangdetailModel(
      {this.id,
      this.createAt,
      this.updateAt,
      this.name,
      this.jumlah,
      this.harga,
      this.kodeBarang,
      this.poto,
      this.status});

  GetbarangdetailModel.fromJson(Map<String, dynamic> json) {
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
