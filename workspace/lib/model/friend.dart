class Friend {
  final int id;
  final String username;

  const Friend({required this.id, required this.username});

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      id: json['id'],
      username: json['username']);
  }
}