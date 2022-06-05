class Getuserone {
  String? mesage;
  Userdatone? data;

  Getuserone({this.mesage, this.data});

  factory Getuserone.fromjson(Map<String, dynamic> json) {
    return Getuserone(
        mesage: json['mesage'], data: Userdatone.fromjson(json['data']));
  }
}

class Userdatone {
  int? id;
  String? nama;
  String? username;
  String? email;
  String? no_telpon;
  String? no_wa;
  String? poto;
  int? RoltableId;
  bool? status;

  Userdatone(
      {this.id,
      this.nama,
      this.username,
      this.email,
      this.no_telpon,
      this.no_wa,
      this.poto,
      this.RoltableId,
      this.status});
  factory Userdatone.fromjson(Map<String, dynamic> json) {
    return Userdatone(
        id: json['id'],
        nama: json['nama'],
        username: json['username'],
        email: json['email'],
        no_telpon: json['no_telpon'],
        no_wa: json['no_wa'],
        poto: json['poto'],
        RoltableId: json['RoltableId'],
        status: json['Status']);
  }
}
