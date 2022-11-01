class Country {
  int id;
  String code;
  String name;
  String? flagUrl;

  Country(
      {required this.id, required this.code, required this.name, this.flagUrl});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        id: json['id'],
        code: json['code'],
        name: json['name'],
        flagUrl: json['flag_url']);
  }
}
