import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pronochain/model/providers/user_provider.dart';
import 'package:pronochain/model/user.dart';
import 'package:pronochain/view/friend_page.dart';
import 'package:pronochain/view/connexion.dart';
import 'package:pronochain/view/widget/appbar.dart';
import '/text_style.dart';
import 'collection.dart';

class Profile extends ConsumerWidget {
  final int? userId;
  const Profile({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserProviderParams userProviderParams = UserProviderParams(ref, userId);
    return Scaffold(
        appBar: const MyAppBar(),
        bottomNavigationBar: const MyBottomAppBar(),
        body: Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              User? user = ref.watch(userProvider(userProviderParams));
              List<Widget> content = <Widget>[];
              if (user == null) {
                content.add(const CircularProgressIndicator());
              } else {
                content = [
                  Text(
                    user.username,
                    textAlign: TextAlign.center,
                    style: TextStylePronochain.poppinsBold35,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: ColorStylePronochain.white,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Collection()),
                          (route) => false);
                    },
                    child: const Text('NFT',
                        style: TextStylePronochain.dosisRegular25Black),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(10.0),
                          backgroundColor: ColorStylePronochain.pink,
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FriendPage(
                                        userId: userId,
                                      )),
                              (route) => false);
                        },
                        child: const Text('Friends',
                            style: TextStylePronochain.dosisRegular25Black),
                      )),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Connexion()),
                          (route) => false);
                    },
                    child: const Text('Logout',
                        style: TextStylePronochain.dosisRegular25Black),
                  ),
                ];
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: content,
              );
            },
          ))
        ]));
  }
}
