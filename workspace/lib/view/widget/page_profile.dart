import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pronochain/view/collection.dart';
import 'package:pronochain/view/friend_page.dart';
import 'package:pronochain/view/widget/appbar.dart';
import '/text_style.dart';

class PageProfile extends ConsumerWidget {
  final List<Widget> content;

  const PageProfile({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MyAppBar(),
      bottomNavigationBar: const MyBottomAppBar(),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: content,
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        height: 50,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                backgroundColor: ColorStylePronochain.white,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Collection()),
                    (route) => false);
              },
              child: const Text('NFT',
                  style: TextStylePronochain.dosisRegular25Black),
            ),
            Container(
                margin: const EdgeInsets.only(left: 2.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(10.0),
                    backgroundColor: ColorStylePronochain.pink,
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FriendPage()),
                        (route) => false);
                  },
                  child: const Text('Friends',
                      style: TextStylePronochain.dosisRegular25Black),
                )),
          ],
        ));
  }
}
