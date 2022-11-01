import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pronochain/model/providers/user_provider.dart';
import 'package:pronochain/model/user.dart';
import 'package:pronochain/view/search_friend.dart';
import 'package:pronochain/text_style.dart';
import 'package:pronochain/view/widget/list_widget.dart';
import 'package:pronochain/view/widget/page_profile.dart';

class FriendPage extends ConsumerWidget {
  final int? userId;
  const FriendPage({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> content = [];

    //faire redirection pour se connecter
    if (ref.watch(userConnectedProvider) == null) {}
    UserProviderParams userProviderParams = UserProviderParams(ref, userId);

    return PageProfile(
      content: <Widget>[
        Expanded(child: Consumer(
          builder: (context, ref, child) {
            User? user = ref.watch(userProvider(userProviderParams));
            if (user == null) {
              return const CircularProgressIndicator();
            }
            if (userId == null && user.friendRequests.isNotEmpty) {
              content.add(
                RequestFriend(requests: user.friendRequests),
              );
            }
            content.add(FriendsList(
              friends: user.friends,
            ));
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: content);
          },
        ))
      ],
    );
  }
}

class ImageAdd extends StatelessWidget {
  final bool forUserConnected;
  const ImageAdd({Key? key, required this.forUserConnected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var assetsImageAddFriends = const AssetImage(
        'images/add_friends.png'); //<- Creates an object that fetches an image.
    var imageAddFriends = Image(
      image: assetsImageAddFriends,
      fit: BoxFit.contain,
      height: 150.0,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            child: imageAddFriends,
          ),
        ),
        Column(children: [
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchFriend()),
                    (route) => false);
              },
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add_outlined),
            ),
            margin: const EdgeInsets.fromLTRB(60, 0, 0, 0),
            decoration: BoxDecoration(
              color: ColorStylePronochain.yellow,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ])
      ],
    );
  }
}

class RequestFriend extends StatelessWidget {
  final List<User> requests;
  const RequestFriend({
    Key? key,
    required this.requests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Friends Request',
            textAlign: TextAlign.center,
            style: TextStylePronochain.poppinsBold25),
        Expanded(
            child: ListView.builder(
                controller: ScrollController(),
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  return Request(
                    request: requests[index],
                  );
                }))
      ],
    ));
  }
}

class Request extends ConsumerWidget {
  final User request;
  const Request({required this.request, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserProviderParams userProviderParams =
        UserProviderParams(ref, ref.watch(userConnectedProvider)!.id);
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(request.username,
                  textAlign: TextAlign.left,
                  style: TextStylePronochain.dosisRegular22),
            ),
          ),
          Container(
              width: 39,
              height: 27,
              margin: const EdgeInsets.only(right: 3),
              decoration: BoxDecoration(
                  color: ColorStylePronochain.green,
                  borderRadius: BorderRadius.circular(6)),
              child: IconButton(
                onPressed: () {
                  ref
                      .read(userProvider(userProviderParams).notifier)
                      .manageFriend(request.id, true);
                },
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.done_outlined),
              )),
          Container(
              width: 39,
              height: 27,
              decoration: BoxDecoration(
                  color: ColorStylePronochain.pink,
                  borderRadius: BorderRadius.circular(6)),
              child: IconButton(
                onPressed: () {
                  ref
                      .read(userProvider(userProviderParams).notifier)
                      .manageFriend(request.id, false);
                },
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.clear_outlined),
              ))
        ],
      ),
    );
  }
}

class FriendsList extends StatelessWidget {
  final List<User> friends;
  const FriendsList({Key? key, required this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Friends',
            textAlign: TextAlign.center,
            style: TextStylePronochain.poppinsBold25),
        Expanded(
            child: ListView.builder(
                controller: ScrollController(),
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  return AFriend(friend: friends[index]);
                }))
      ],
    ));
  }
}

class AFriend extends StatelessWidget {
  final User friend;
  const AFriend({required this.friend, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FriendPage(
                                userId: friend.id,
                              )),
                      (route) => false);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(friend.username,
                      textAlign: TextAlign.left,
                      style: TextStylePronochain.dosisRegular22),
                )),
          ),
        ],
      ),
    );
  }
}
