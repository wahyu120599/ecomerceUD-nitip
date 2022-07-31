class CountTerjual {
  int? totalrupiahterjual;
  int? jumlahTerjual;

  CountTerjual({this.totalrupiahterjual, this.jumlahTerjual});

  CountTerjual.fromJson(Map<String, dynamic> json) {
    totalrupiahterjual = json['totalrupiahterjual'];
    jumlahTerjual = json['jumlah_terjual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalrupiahterjual'] = this.totalrupiahterjual;
    data['jumlah_terjual'] = this.jumlahTerjual;
    return data;
  }
}
