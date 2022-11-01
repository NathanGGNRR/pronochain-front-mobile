import 'package:pronochain/model/country.dart';

class League {
  int id;
  String code;
  String name;
  String type;
  bool isEnabled;
  int countryId;
  int sportId;
  Country? country;

  League({
    required this.id,
    required this.code,
    required this.name,
    required this.type,
    required this.isEnabled,
    required this.countryId,
    required this.sportId,
    this.country,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
        id: json['id'],
        code: json['code'],
        name: json['name'],
        type: json['type'],
        isEnabled: json['is_enabled'],
        countryId: json['country_id'],
        sportId: json['sport_id'],
        country: Country.fromJson(json['country']));
  }
}
