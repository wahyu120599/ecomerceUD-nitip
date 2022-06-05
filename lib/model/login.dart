class Loginmodel {
  String? mesage;
  Datalogin? data;
  String? acces_token;
  Loginmodel({this.mesage, this.data, this.acces_token});
  factory Loginmodel.fromjson(Map<String, dynamic> json) {
    return Loginmodel(
        mesage: json['mesage'],
        data: (json['data'] != null)
            ? Datalogin.fromjson(json['data'])
            : json['data'],
        acces_token: json['acces_token']);
  }
}

class Datalogin {
  int? id;
  String? nama;
  String? username;
  String? email;
  String? no_telpon;
  String? no_wa;
  int? RoltableId;

  Datalogin(
      {this.id,
      this.nama,
      this.username,
      this.email,
      this.no_telpon,
      this.no_wa,
      this.RoltableId});

  factory Datalogin.fromjson(Map<String, dynamic> json) {
    return Datalogin(
      id: json['id'],
      nama: json['nama'],
      username: json['username'],
      email: json['email'],
      no_telpon: json['no_telpon'],
      no_wa: json['no_wa'],
      RoltableId: json['RoltableId'],
    );
  }
}
