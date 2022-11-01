class Team {
  int id;
  String code;
  String name;
  String? logo;
  int countryId;
  int sportId;

  Team(
      {required this.id,
      required this.code,
      required this.name,
      this.logo,
      required this.countryId,
      required this.sportId});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
        id: json['id'],
        code: json['code'],
        name: json['name'],
        logo: json['logo'],
        countryId: json['country_id'],
        sportId: json['sport_id']);
  }
}
