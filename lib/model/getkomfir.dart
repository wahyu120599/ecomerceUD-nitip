class Getkomfirmasi {
  String? message;
  List<Komfirdata>? data;
  Getkomfirmasi({this.message, this.data});
  factory Getkomfirmasi.fromjson(Map<String, dynamic> json) {
    return Getkomfirmasi(
        message: json["mesage"],
        data: List<Komfirdata>.from(
            json["data"].map((x) => Komfirdata.fromjson(x))));
  }
}

class Komfirdata {
  int? id;
  String? nama;
  String? email;
  String? no_wa;
  String? no_telpon;

  Komfirdata({this.id, this.nama, this.email, this.no_wa, this.no_telpon});

  factory Komfirdata.fromjson(Map<String, dynamic> json) {
    return Komfirdata(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        no_wa: json["no_wa"],
        no_telpon: json["no_telpon"]);
  }
}
