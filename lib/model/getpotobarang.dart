class Getpotobarang {
  String? mesage;
  List<Datapotobarang>? databarang;

  Getpotobarang({this.databarang, this.mesage});

  factory Getpotobarang.fromjson(Map<String, dynamic> json) {
    return Getpotobarang(
        mesage: json["mesage"],
        databarang: (json["data"] != null)
            ? List<Datapotobarang>.from(
                json["data"].map((x) => Datapotobarang.fromjson(x)))
            : []);
  }
}

class Datapotobarang {
  int? id;
  String? imagepath;

  Datapotobarang({this.id, this.imagepath});

  factory Datapotobarang.fromjson(Map<String, dynamic> json) {
    return Datapotobarang(id: json["id"], imagepath: json["imagepath"]);
  }
}
