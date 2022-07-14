class Bayarwithmitranst {
  Datataobjek? data;
  Bayarwithmitranst({this.data});
  factory Bayarwithmitranst.frojson(Map<String, dynamic> json) =>
      Bayarwithmitranst(data: Datataobjek.fromjson(json["data"]));
}

class Datataobjek {
  List<Va_number>? va_number;
  Datataobjek({this.va_number});
  factory Datataobjek.fromjson(Map<String, dynamic> json) => Datataobjek(
      va_number: List<Va_number>.from(
          json["va_number"].map((x) => Va_number.fromjson(x))));
}

class Va_number {
  String? bank;
  String? va_number;

  Va_number({this.bank, this.va_number});

  factory Va_number.fromjson(Map<String, dynamic> json) {
    return Va_number(bank: json["bank"], va_number: json["va_number"]);
  }
}
