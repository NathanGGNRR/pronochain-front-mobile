class Team {
  final int id;
  final String code;
  final String name;

  const Team({
    required this.id,
    required this.code,
    required this.name,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(id: json['id'], code: json['code'], name: json['name']);
  }
}
