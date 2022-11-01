import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pronochain/model/user.dart';

class UserNotifier extends StateNotifier<User?> {
  WidgetRef ref;
  UserNotifier(int? userId, this.ref) : super(null) {
    load(userId);
  }
  void load(int? userId) async {
    if (userId == null &&
        (state == null || ref.watch(userConnectedProvider)!.id != state!.id)) {
      state = User(
          id: 1,
          username: "UserConnected",
          friends: <User>[
            User(
                id: 3,
                username: "NattanGagn",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: []),
            User(
                id: 4,
                username: "Pêcheur21",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: []),
            User(
                id: 5,
                username: "Schalk_Shark",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: []),
            User(
                id: 6,
                username: "User1",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: []),
            User(
                id: 7,
                username: "User2",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: []),
            User(
                id: 8,
                username: "User3",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: [])
          ],
          friendRequests: <User>[
            User(
                id: 3,
                username: "Clemgon",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: []),
            User(
                id: 4,
                username: "Dams",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: []),
            User(
                id: 5,
                username: "Me",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: []),
            User(
                id: 6,
                username: "TwoNight",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: []),
            User(
                id: 7,
                username: "OtherUser",
                hasBlockedInvitation: false,
                friends: [],
                friendRequests: [])
          ],
          hasBlockedInvitation: false);
    } else {
      state = User(
          id: 1,
          username: "OtherUser",
          friends: <User>[],
          friendRequests: <User>[],
          hasBlockedInvitation: false);
    }
  }

  void manageFriend(int friendId, bool accepted) {
    if (state != null) {
      User user = state!.clone();
      Iterable<User> friend =
          user.friendRequests.where((element) => element.id == friendId);
      user.friendRequests.removeWhere((element) => element.id == friendId);

      if (accepted && friend.isNotEmpty) {
        user.friends.add(friend.first);
      }
    }
  }
}

class UserProviderParams {
  final int? userId;
  final WidgetRef ref;

  UserProviderParams(this.ref, this.userId);
}

final userProvider =
    StateNotifierProvider.family<UserNotifier, User?, UserProviderParams>(
        (ref, params) {
  return UserNotifier(params.userId, params.ref);
});

final userConnectedProvider = StateProvider<User?>((ref) {
  return User(
      id: 1,
      username: "UserConnected",
      friends: <User>[],
      friendRequests: <User>[],
      hasBlockedInvitation: false);
});

final tokenProvider = StateProvider<String?>((ref) {
  return null;
});

final refreshTokenProvider = StateProvider<String?>((ref) {
  return null;
});
