class Reguser {
  String? mesage;
  Datareguser? data;

  Reguser({this.mesage, this.data});

  factory Reguser.fromjson(Map<String, dynamic> json) {
    return Reguser(
        mesage: json['mesage'],
        data: (json['data'] != null)
            ? Datareguser.fromjson(json['data'])
            : json['data']);
  }
}

class Datareguser {
  int? id;
  String? nama;
  String? username;
  String? email;
  String? no_telpon;
  String? no_wa;
  String? poto;
  String? RoltableId;

  Datareguser(
      {this.id,
      this.nama,
      this.username,
      this.email,
      this.no_telpon,
      this.no_wa,
      this.poto,
      this.RoltableId});

  factory Datareguser.fromjson(Map<String, dynamic> json) {
    return Datareguser(
        id: json['id'],
        nama: json['nama'],
        username: json['username'],
        email: json['email'],
        no_telpon: json['no_telpon'],
        no_wa: json['no_wa'],
        poto: json['poto'],
        RoltableId: json['RoltableId']);
  }
}
