class postrool {
  String? mesage;
  Data? data;

  postrool({this.mesage, this.data});

  factory postrool.fromJson(Map<String, dynamic> json) {
    return postrool(
        mesage: json['mesage'],
        data: json['data'] != null ? new Data.fromJson(json['data']) : null);
  }
}

class Data {
  int? id;
  String? rolname;

  Data({this.id, this.rolname});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      rolname: json['rolname'],
    );
  }
}
