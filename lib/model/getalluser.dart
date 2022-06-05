class Getuserall {
  String? mesage;
  List<Userdatall>? data;

  Getuserall({this.mesage, this.data});

  factory Getuserall.fromjson(Map<String, dynamic> json) {
    return Getuserall(
        mesage: json['mesage'],
        data: List<Userdatall>.from(
            json['data'].map((x) => Userdatall.fromjson(x))));
  }
}

class Userdatall {
  int? id;
  String? nama;
  String? username;
  String? email;
  String? no_telpon;
  String? no_wa;
  String? poto;
  int? RoltableId;
  bool? status;

  Userdatall(
      {this.id,
      this.nama,
      this.username,
      this.email,
      this.no_telpon,
      this.no_wa,
      this.poto,
      this.RoltableId,
      this.status});
  factory Userdatall.fromjson(Map<String, dynamic> json) {
    return Userdatall(
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
