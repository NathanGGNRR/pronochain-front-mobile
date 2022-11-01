import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/page_profile.dart';

class SearchFriend extends StatelessWidget {
  const SearchFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageContent = [
      const Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 5),
        child: Text('Friends',
            textAlign: TextAlign.center,
            style: TextStylePronochain.poppinsBold45),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
        child: SearchBar(),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return const FriendResult(
                    name: 'Excalibur_24', image: 'pp.png');
              }))
    ];

    return PageProfile(content: pageContent);
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //<- Creates a widget that displays an image.
    return Row(
      children: [
        const Expanded(
          child: SizedBox(
            height: 49,
            child: TextField(
              obscureText: false,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: ColorStylePronochain.backgroundColor,
                  fontFamily: PoliceStylePronochain.dosisRegular,
                  fontSize: 22),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search Friend',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ),
        Container(
          height: 49,
          width: 63,
          child: IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.search_outlined,
              size: 40,
            ),
          ),
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: ColorStylePronochain.blue,
            borderRadius: BorderRadius.circular(6),
          ),
        )
      ],
    );
  }
}

class FriendResult extends StatelessWidget {
  final String name;
  final String image;
  const FriendResult({required this.name, required this.image, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(20),
              child: Image.asset(
                'images/' + image,
                fit: BoxFit.cover,
              ),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(name,
                  textAlign: TextAlign.left,
                  style: TextStylePronochain.dosisRegular22),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Invite'),
            style: TextButton.styleFrom(
                primary: ColorStylePronochain.backgroundColor),
          )
        ],
      ),
    );
  }
}
