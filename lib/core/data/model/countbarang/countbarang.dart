class CountBarang {
  int? jumlahbarang;
  int? dalamrupiah;

  CountBarang({this.jumlahbarang, this.dalamrupiah});

  CountBarang.fromJson(Map<String, dynamic> json) {
    jumlahbarang = json['jumlahbarang'];
    dalamrupiah = json['dalamrupiah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jumlahbarang'] = this.jumlahbarang;
    data['dalamrupiah'] = this.dalamrupiah;
    return data;
  }
}
