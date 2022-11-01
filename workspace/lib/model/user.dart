class User {
  int id;
  String username;
  bool hasBlockedInvitation;
  String? createdAt;
  String? updatedAt;
  List<User> friends;
  List<User> friendRequests;

  User(
      {required this.id,
      required this.username,
      required this.hasBlockedInvitation,
      this.createdAt,
      this.updatedAt,
      required this.friends,
      required this.friendRequests});

  User clone() {
    return User(
        id: id,
        username: username,
        friendRequests: friendRequests,
        friends: friends,
        hasBlockedInvitation: hasBlockedInvitation,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  factory User.fromJson(Map<String, dynamic> json) {
    List<User> friendsList = <User>[];
    if (json['friends'] != null) {
      json['friends'].forEach((v) {
        friendsList.add(User.fromJson(v));
      });
    }
    List<User> friendRequestList = <User>[];
    if (json['friend_requests'] != null) {
      json['friend_requests'].forEach((v) {
        friendRequestList.add(User.fromJson(v));
      });
    }
    return User(
        id: json['id'],
        username: json['username'],
        hasBlockedInvitation: json['has_blocked_invitation'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        friends: friendsList,
        friendRequests: friendRequestList);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['has_blocked_invitation'] = hasBlockedInvitation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['friends'] = friends.map((v) => v.toJson()).toList();
    data['friend_requests'] = friendRequests.map((v) => v.toJson()).toList();
    return data;
  }
}
