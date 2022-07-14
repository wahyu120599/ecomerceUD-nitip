class Getkategoribyid {
  String? message;
  Datakategoribyid? data;

  Getkategoribyid({this.message, this.data});

  factory Getkategoribyid.fromjson(Map<String, dynamic> json) {
    return Getkategoribyid(
        message: json["mesage"], data: Datakategoribyid.fromjson(json["data"]));
  }
}

class Datakategoribyid {
  int? id;
  String? namakategori;

  Datakategoribyid({this.id, this.namakategori});
  factory Datakategoribyid.fromjson(Map<String, dynamic> json) {
    return Datakategoribyid(id: json["id"], namakategori: json["namakategori"]);
  }
}
