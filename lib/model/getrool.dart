class Getrool {
  String? mesage;
  List<Datarool>? data;

  Getrool({this.mesage, this.data});

  factory Getrool.fromJson(Map<String, dynamic> json) {
    return Getrool(
        mesage: json['mesage'],
        data:
            List<Datarool>.from(json["data"].map((x) => Datarool.fromJson(x))));
  }
}

class Datarool {
  int? id;
  String? rolname;

  Datarool({this.id, this.rolname});

  factory Datarool.fromJson(Map<String, dynamic> json) {
    return Datarool(
      id: json['id'],
      rolname: json['rolname'],
    );
  }
}
