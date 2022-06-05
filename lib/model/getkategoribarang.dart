class Getkategoribarang {
  String? message;
  List<Datakategori>? data;

  Getkategoribarang({this.message, this.data});
  factory Getkategoribarang.fromjson(Map<String, dynamic> json) {
    return Getkategoribarang(
        message: json['mesage'],
        data: (json['data'] != null)
            ? List<Datakategori>.from(
                json['data'].map((x) => Datakategori.fromjson(x)))
            : []);
  }
}

class Datakategori {
  int? id;
  String? namakategori;

  Datakategori({this.id, this.namakategori});

  factory Datakategori.fromjson(Map<String, dynamic> json) {
    return Datakategori(id: json['id'], namakategori: json['namakategori']);
  }
}
