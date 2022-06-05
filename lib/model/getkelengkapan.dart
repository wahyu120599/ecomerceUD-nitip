class Getkelengkapan {
  String? mesage;
  List<Datakelengkapan>? datakelengkapan;

  Getkelengkapan({this.mesage, this.datakelengkapan});

  factory Getkelengkapan.fromjson(Map<String, dynamic> json) {
    return Getkelengkapan(
        mesage: json["mesage"],
        datakelengkapan: List<Datakelengkapan>.from(
            json["data"].map((x) => Datakelengkapan.fromjson(x))));
  }
}

class Datakelengkapan {
  int? id;
  String? dpkument;
  int? BarangId;

  Datakelengkapan({this.id, this.dpkument, this.BarangId});

  factory Datakelengkapan.fromjson(Map<String, dynamic> json) {
    return Datakelengkapan(
        id: json['id'], BarangId: json['BarangId'], dpkument: json["dokumen"]);
  }
}
